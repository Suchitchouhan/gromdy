from django.shortcuts import render
from django.views.generic import CreateView, ListView, UpdateView, DetailView
from django.shortcuts import render,redirect
from django.utils.crypto import get_random_string
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login
from django.contrib.auth import logout
from django.contrib.auth.decorators import permission_required
from django.contrib.auth.models import User
from .models import *
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from prico.models import *
from django.utils.text import slugify
from datetime import timedelta , datetime
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import json
from prico.models import *
from django.conf import settings
from django.core.mail import send_mail

def check_blank_or_null(data):
	status=True
	for x in data:
		if x=="" or x==None:
			status=False
			break
		else:
			pass					
	return status	

def check_length(data):
	status=True
	for x in data:
		if len(x[0])<=x[1]:
			status=True
		else:
			pass
	return status


def check_null(data):
	status=True
	for x in data:
		if x==None:
			status=False
			break
		else:
			pass					
	return status	

def login_view(request):
	context={}
	if request.user.is_authenticated:
		return redirect("/cms/index")
	if request.method=="POST":
		username=request.POST.get("username")
		password=request.POST.get("password")
		user=authenticate(username=username,password=password)
		if user is not None:
			login(request, user)
			if employee.objects.filter(user=user,is_verified=True).exists():
				return redirect("/cms/index")
			else:
				context['status']='your profile is not verified as vendor'	
			context['status']="login successfully"
		else:
			context['status']="email and password is not exists" 
		return render(request,"cms/login.html",context)
	else:
		return render(request,"cms/login.html",context)

@login_required()
def index(request):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		context['fullname']=request.user.first_name+" "+request.user.last_name
		context['total_customer']=User.objects.all().count()
		context['totot_order']=order.objects.all().count()
		context['total_product']=product.objects.all().count()
		context['totot_order_today']=order.objects.filter(date__date=datetime.now().date()).count()
		return render(request,'cms/index.html',context)
	else:
		return redirect("/")


@login_required()
def logout_view(request):
    logout(request)
    return redirect("/cms/")

@login_required()
def view_product(request):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		context['product_count']=product.objects.all().count()
		context['product_instock']=product.objects.filter(stock=True).count()
		context['product_outstock']=product.objects.filter(stock=False).count()
		context['product_verified']=product.objects.filter(is_verified=True).count()
		context['product_not_verified']=product.objects.filter(is_verified=False).count()
		if request.method == "POST":
			name=request.POST.get("name")
			cat_id=request.POST.get("cat_id")
			if check_blank_or_null([name]) and check_null([cat_id]) and cat_id=="":
				prod=product.objects.filter(name__icontains=name)
			elif check_blank_or_null([cat_id]) and check_null([name]) and name=="":
				if category.objects.filter(pk=cat_id).exists():
					cat=category.objects.get(pk=cat_id)
					prod=product.objects.filter(category=cat)
				else:
					prod=product.objects.all()
					context['status']='category is not exists ,Do not try to fuck with me. ass hole'
			elif check_blank_or_null([name,cat_id]):
				if category.objects.filter(pk=cat_id).exists():
					cat=category.objects.get(pk=cat_id)
					prod=product.objects.filter(category=cat,name__icontains=name)
				else:
					prod=product.objects.all()
					context['status']='category is not exists ,Do not try to fuck with me. ass hole'			
		else:
			prod=product.objects.all().order_by("-id")
		imageO=[]
		featureO=[]
		sideeffectO=[]
		questionO=[]
		reviewO=[]
		for x in prod:
			imageO.append(str(image.objects.filter(product=x).count()))
			featureO.append(str(feature.objects.filter(product=x).count()))
			sideeffectO.append(str(side_effect.objects.filter(product=x).count()))
			questionO.append(str(question.objects.filter(product=x).count()))
			reviewO.append(str(review.objects.filter(product=x).count()))
		prodOO=list(zip(prod,imageO,featureO,sideeffectO,questionO,reviewO))
		page = request.GET.get('page', 1)
		paginator = Paginator(prodOO, 20)
		try:
			productO = paginator.page(page)
		except PageNotAnInteger:
			productO = paginator.page(1)
		except EmptyPage:
			productO = paginator.page(paginator.num_pages)
		context['product']=productO
		cat=[]
		prod_count=[]
		for x in category.objects.all():
			cat.append(x)
			prod_count.append(product.objects.filter(category=x).count())
		context['category']=zip(cat,prod_count)	
		return render(request,'cms/view_product.html',context)
	else:
		return redirect("/")	


@login_required()
def add_product(request):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		if request.method == "POST":
			name=request.POST.get("name")
			description=request.POST.get("description")
			brandname=request.POST.get("brandname")
			actual_price=request.POST.get("actual_price")
			price=request.POST.get("price")
			cat_id=request.POST.get('cat_id')
			keyword=request.POST.get("keyword")
			is_verified=request.POST.get("is_verified")
			if check_blank_or_null([name,description,brandname,price,cat_id,is_verified]) and check_length([[name,200],[brandname,200]]) and price.isdigit() and actual_price.isdigit() and is_verified in ['yes','no']:
				if int(price) > 0 and int(actual_price)>0:
					if category.objects.filter(pk=cat_id).exists():
						if product.objects.filter(name=name).exists() == False and product.objects.filter(url_slug=slugify(name)).exists() == False:
							prod=product.objects.create(name=name)
							prod.description=description
							prod.brandname=brandname
							prod.actual_price=int(actual_price)
							prod.price=int(price)
							prod.url_slug=slugify(name)
							prod.category=category.objects.get(pk=cat_id)
							if is_verified == "yes":
								prod.is_verified=True
							else:
								prod.is_verified = False
							prod.keyword=keyword		
							prod.save()
							context['status']="Your product has been successfully added and fill other details about the product"
						else:
							context['status']="Product and Slug is already exists .Please update"	
					else:
						context['status']="category is not exists"
				else:
					context['status']="Price can not be zero "
			else:
				context['status']='Input data is not in right format'
			context['category']=category.objects.all()	
		else:
			context['category']=category.objects.all()
		return render(request,'cms/add_product.html',context)
	else:
		return redirect("/")	



@login_required()
def delete_product(request):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		if request.method == "POST":
			pk=request.POST.get('med_id')
			print(pk)
			if check_blank_or_null([pk]) and product.objects.filter(pk=pk).exists():
				prod=product.objects.get(pk=pk)
				prod.delete()
				context['status']="delete successfully"
			else:
				context['status']="product is not exists"
			print(context)	
			return render(request,'cms/view_medican.html',context)
		else:	
			return render(request,'cms/view_medican.html',context)


@login_required()
def update_product(request,pk):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		if request.method == "POST":
			description=request.POST.get("description")
			brandname=request.POST.get("brandname")
			actual_price=request.POST.get("actual_price")
			stock=request.POST.get("stock")
			price=request.POST.get("price")
			cat_id=request.POST.get('cat_id')
			keyword=request.POST.get("keyword")
			is_verified=request.POST.get("is_verified")
			if check_blank_or_null([description,brandname,price,cat_id,stock,is_verified]) and check_length([[brandname,200]]) and price.isdigit() and actual_price.isdigit() and is_verified in ['yes','no'] and stock in ['yes','no']:
				if int(price) > 0 and int(actual_price)>0:
					if category.objects.filter(pk=cat_id).exists():
						prod=product.objects.get(pk=pk)
						prod.description=description
						prod.brandname=brandname
						prod.actual_price=int(actual_price)
						prod.price=int(price)
						prod.category=category.objects.get(pk=cat_id)
						if is_verified == "yes":
							prod.is_verified=True
						else:
							prod.is_verified = False
						if stock == "yes":
							prod.stock=True
						else:
							prod.stock=False		
						prod.keyword=keyword		
						prod.save()
						context['status']="Your product has been successfully Update and fill other details about the product"
					else:
						context['status']="category is not exists"
				else:
					context['status']="Price can not be zero "
			else:
				context['status']='Input data is not in right format'
			if product.objects.filter(pk=pk).exists():
				prodO=product.objects.get(pk=pk)
				cat=[]
				for x in category.objects.all():
					if x != prodO.category:
						cat.append(x)
				context['product']=prodO
				context['category']=cat
				context['feature']=list(feature.objects.filter(product=prodO).order_by('-id').values('id','name','description'))
				context['side_effect']=list(side_effect.objects.filter(product=prodO).order_by("-id").values('id','name','summery'))
				context['question']=list(question.objects.filter(product=prodO).order_by("-id").values('id','ques','answer'))

			else:
				context['status']="product is not exists"			
		else:
			if product.objects.filter(pk=pk).exists():
				prod=product.objects.get(pk=pk)
				cat=[]
				for x in category.objects.all():
					if x != prod.category:
						cat.append(x)
				context['product']=prod
				context['category']=cat
				context['feature']=list(feature.objects.filter(product=prod).order_by('-id').values('id','name','description'))
				context['side_effect']=list(side_effect.objects.filter(product=prod).order_by("-id").values('id','name','summery'))
				context['question']=list(question.objects.filter(product=prod).order_by("-id").values('id','ques','answer'))

			else:
				context['status']="product is not exists"
		return render(request,'cms/update_product.html',context)
	else:
		return redirect("/")	
	

@csrf_exempt
def add_feature(request):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == 'POST':
				pk=request.POST.get("product_id")
				name=request.POST.get('name')
				description=request.POST.get('description')
				if check_blank_or_null([name,description,pk]) and check_length([[name,100]]) and pk.isdigit():
					if product.objects.filter(pk=pk).exists():
						productO=product.objects.get(pk=pk)
						featureO,__=feature.objects.get_or_create(name=name,product=productO)
						featureO.description=description
						featureO.save()
						context['status']="success"
						context['feature']=list(feature.objects.filter(product=productO).order_by('-id').values('id','name','description'))
						
					else:
						context['status']='product is not exists'	
				else:
					context['status']='Any Field can not be empty'
			else:
				context['status']="Get method is not allowed"
		else:
			context['status']="You are not authorized"
	else:
		context['status']="Login required"				
	return JsonResponse(context)	


		
@csrf_exempt
def add_side_effect(request):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == 'POST':
				pk=request.POST.get("product_id")
				name=request.POST.get('name')
				description=request.POST.get('description')
				if check_blank_or_null([name,description]) and check_length([[name,100]]):
					if product.objects.filter(pk=pk).exists():
						productO=product.objects.get(pk=pk)
						featureO,__=side_effect.objects.get_or_create(name=name,product=productO)
						featureO.summery=description
						featureO.save()
						context['status']="success"
						context['side_effect']=list(side_effect.objects.filter(product=productO).order_by("-id").values('id','name','summery'))
					else:
						context['status']="Product is not exists"	
				else:
					context['status']='Any Field can not be empty'
			else:
				context['status']="login_required"
		else:
			context['status']="You are not authorized"
	else:
		context['status']="Login required"				
	return JsonResponse(context)	


@csrf_exempt
def delete_feature(request):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == "POST":
				pk=request.POST.get("pk")
				if feature.objects.filter(pk=pk).exists():
					f=feature.objects.get(pk=pk)
					f.delete()
					context['status']="success"
				else:
					context['status']="feature is not exists"	
			else:
				context['status']='Get method is allowed.FuckYourself do not try to fuck with me.'
		else:
			context['status']="You are not authorized"
	else:
		context['status']="Login required"	
	return JsonResponse(context)


@csrf_exempt
def delete_side_effect(request):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == "POST":
				pk=request.POST.get("pk")
				if side_effect.objects.filter(pk=pk).exists():
					f=side_effect.objects.get(pk=pk)
					f.delete()
					context['status']="success"
				else:
					context['status']="side effect is not exists"	
			else:
				context['status']='Get method is allowed.FuckYourself do not try to fuck with me.'
		else:
			context['status']="You are not authorized"
	else:
		context['status']="Login required"	
	return JsonResponse(context)


@csrf_exempt
def add_question(request):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == 'POST':
				pk=request.POST.get("product_id")
				name=request.POST.get('name')
				description=request.POST.get('description')
				if check_blank_or_null([name,description]) and check_length([[name,100]]):
					if product.objects.filter(pk=pk).exists():
						productO=product.objects.get(pk=pk)
						featureO,__=question.objects.get_or_create(ques=name,product=productO)
						featureO.answer=description
						featureO.save()
						context['status']="success"
						context['question']=list(question.objects.filter(product=productO).order_by("-id").values('id','ques','answer'))
					else:
						context['status']="Product is not exists"	
				else:
					context['status']='Any Field can not be empty'
			else:
				context['status']="login_required"
		else:
			context['status']="You are not authorized"
	else:
		context['status']="Login required"				
	return JsonResponse(context)	



@csrf_exempt
def delete_question(request):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == "POST":
				pk=request.POST.get("pk")
				if question.objects.filter(pk=pk).exists():
					f=question.objects.get(pk=pk)
					f.delete()
					context['status']="success"
				else:
					context['status']="question is not exists"	
			else:
				context['status']='Get method is allowed.FuckYourself do not try to fuck with me.'
		else:
			context['status']="You are not authorized"
	else:
		context['status']="Login required"	
	return JsonResponse(context)


@login_required()
def add_image(request,pk):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		if product.objects.filter(pk=pk).exists():
			productO=product.objects.get(pk=pk)
			if request.method == 'POST':
				p_image=request.FILES['p_image']
				if check_blank_or_null([p_image]) and check_length([[p_image,100]]):
					img=image.objects.create(product=productO)
					img.image=p_image
					img.save()
					return redirect("/cms/add_image/"+str(productO.pk))
					# context['status']='image has been added successfully'
				else:
					context['status']='length of image can be more then 100'
				context['image']=image.objects.filter(product=productO)	
			else:
				context['image']=image.objects.filter(product=productO)
		else:
			context['status']='product is not exists'
		context['pk']=pk	
		return render(request,'cms/view_image.html',context)
	else:
		return redirect("/")	
	

@csrf_exempt
def delete_image(request):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == "POST":
				pk=request.POST.get("pk")
				if image.objects.filter(pk=pk).exists():
					img=image.objects.get(pk=pk)
					img.delete()
					context['status']="success"
				else:
					context['status']='imageexists'
			else:
				context['status']="getmethod is not allowed"		
		else:
			context['status']="notexists"
	else:
		context['status']="login_required"
	return JsonResponse(context)			


@login_required()
def view_review(request,pk):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if product.objects.filter(pk=pk).exists():
				p=product.objects.get(pk=pk)
				context['review']=review.objects.filter(product=p)
			else:
				context['status']="Product not exists"
		else:
			return redirect("/")
	else:
		return redirect("/login")
	return render(request,"cms/view_review.html",context)					




@login_required()
def view_order(request):
	context={}
	orderstatus=["pending","packed","readyforship","shipped","canceled","completed","refunded","refund proccess start","partially refunded","canceled by customer"]
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == "POST":
				order_id=request.POST.get("order_id")
				start_date=request.POST.get("start_date")
				end_date=request.POST.get("end_date")
				status=request.POST.get("status")
				if check_blank_or_null([order_id]) and check_blank_or_null([start_date,end_date,status]) == False:
					oo=order.objects.filter(uid__icontains=order_id).order_by("-id")
				elif check_blank_or_null([start_date,end_date]) and check_blank_or_null([order_id,status]) ==False:
					oo=order.objects.filter(date__range=[start_date, end_date]).order_by("-id")
				elif check_blank_or_null([status]) and check_blank_or_null([start_date,end_date,status]) == False and status in orderstatus:	
					oo=order.objects.filter(status=status).order_by("-id")
				elif check_blank_or_null([order_id,start_date,end_date]) and check_blank_or_null([status]):					
					oo=order.objects.filter(uid__icontains=order_id,date__range=[start_date, end_date]).order_by("-id")
				elif check_blank_or_null([start_date,end_date,status]) and check_blank_or_null([order_id]) ==False:
					oo=order.objects.filter(date__range=[start_date, end_date],status=status).order_by("-id")
				else:
					oo=order.objects.all().order_by("-id")
			else:
				oo=order.objects.all().order_by("-id")
			page = request.GET.get('page', 1)
			paginator = Paginator(oo, 20)
			try:
				ooo = paginator.page(page)
			except PageNotAnInteger:
				ooo = paginator.page(1)
			except EmptyPage:
				ooo = paginator.page(paginator.num_pages)
			context['order']=ooo
			context['orderstatus']=orderstatus
			return render(request,"cms/view_order.html",context)
		else:
			return redirect("/")
	else:
		return redirect("/login")			



@login_required
def order_items(request,uid):
	context={}
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if order.objects.filter(uid=uid).exists():
				oo=order.objects.get(uid=uid)
				order_itemO=order_item.objects.filter(order=oo)
				context['items']=order_itemO
			else:
				context['status']="order is not exists"
		else:
			return redirect("/")
	else:
		return redirect("/login")
	return render(request,"cms/order_items.html",context)						


@login_required
def change_status(request,uid):
	context={}
	orderstatus=["pending","packed","readyforship","shipped","canceled","completed","refunded","refund proccess start","partially refunded","canceled by customer"]
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if order.objects.filter(uid=uid).exists():
				oo=order.objects.get(uid=uid)
				if request.method == "POST":
					name=request.POST.get("name")
					des=request.POST.get("des")
					if check_blank_or_null([name,des]):
						orderstatusO,__=order_status.objects.get_or_create(order=oo,name=name)
						orderstatusO.description=des
						orderstatusO.save()
						context['status']="success"
						mn=f"Hi {oo.user.first_name} {oo.user.last_name} \nYour order {oo.uid} has been {name}.\nStay home and stay safe.\nRegards\n\nSuchit chouhan" 
						send_mail("GROMDY"+"-order status Change "+oo.uid, mn, settings.EMAIL_HOST_USER, [oo.user.email] )
					else:
						context['status']="Name and descriptions is not right"
					context['all_status']=order_status.objects.filter(order=oo)

					context['uid']=uid	
				else:
					context['uid']=uid
					context['all_status']=order_status.objects.filter(order=oo)	
			else:
				context['status']="order is not exists"		
			context['orderstatus']=	orderstatus
			print(context['all_status'])
			return render(request,"cms/change_status.html",context)
		else:
			return redirect("/")
	else:
		return redirect("/login")				
								


@login_required
def view_user(request):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		if request.method == "POST":
			email=request.POST.get("email")
			if check_blank_or_null([email]):
				user=User.objects.filter(email__icontains = email)
		else:
			user=User.objects.all().order_by("-id")
		page = request.GET.get('page', 1)
		paginator = Paginator(user, 20)
		try:
			ooo = paginator.page(page)
		except PageNotAnInteger:
			ooo = paginator.page(1)
		except EmptyPage:
			ooo = paginator.page(paginator.num_pages)	
		context['user']=ooo
		return render(request,"cms/view_user.html",context)
	else:
		return redirect("/")





@login_required()
def view_order_by_user(request,email):
	context={}
	context['email']=email
	if User.objects.filter(username=email).exists() == False:
		context['status']="User Is not exists"
		return render(request,"cms/view_order.html",context)
	else:
		user=User.objects.get(username=email)	
	orderstatus=["pending","packed","readyforship","shipped","canceled","completed","refunded","refund proccess start","partially refunded","canceled by customer"]
	if request.user.is_authenticated:
		if employee.objects.filter(user=request.user,is_verified=True).exists():
			if request.method == "POST":
				order_id=request.POST.get("order_id")
				start_date=request.POST.get("start_date")
				end_date=request.POST.get("end_date")
				status=request.POST.get("status")
				if check_blank_or_null([order_id]) and check_blank_or_null([start_date,end_date,status]) == False:
					oo=order.objects.filter(user=user,uid__icontains=order_id).order_by("-id")
				elif check_blank_or_null([start_date,end_date]) and check_blank_or_null([order_id,status]) ==False:
					oo=order.objects.filter(user=user,date__range=[start_date, end_date]).order_by("-id")
				elif check_blank_or_null([status]) and check_blank_or_null([start_date,end_date,status]) == False and status in orderstatus:	
					oo=order.objects.filter(user=user,status=status).order_by("-id")
				elif check_blank_or_null([order_id,start_date,end_date]) and check_blank_or_null([status]):					
					oo=order.objects.filter(user=user,uid__icontains=order_id,date__range=[start_date, end_date]).order_by("-id")
				elif check_blank_or_null([start_date,end_date,status]) and check_blank_or_null([order_id]) ==False:
					oo=order.objects.filter(user=user,date__range=[start_date, end_date],status=status).order_by("-id")
				else:
					oo=order.objects.filter(user=user).order_by("-id")
			else:
				oo=order.objects.filter(user=user).order_by("-id")
			page = request.GET.get('page', 1)
			paginator = Paginator(oo, 20)
			try:
				ooo = paginator.page(page)
			except PageNotAnInteger:
				ooo = paginator.page(1)
			except EmptyPage:
				ooo = paginator.page(paginator.num_pages)
			context['order']=ooo
			context['orderstatus']=orderstatus
			return render(request,"cms/view_order.html",context)
		else:
			return redirect("/")
	else:
		return redirect("/login")			



@login_required()
def view_contactus_request(request):
	context={}
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		con=contact_us.objects.all().order_by("-id")
		page = request.GET.get('page', 1)
		paginator = Paginator(con, 20)
		try:
			ooo = paginator.page(page)
		except PageNotAnInteger:
			ooo = paginator.page(1)
		except EmptyPage:
			ooo = paginator.page(paginator.num_pages)
		context['contact_us']=ooo
		return render(request,"cms/view_contactus_request.html",context)
	else:
		return redirect("/")

	
@login_required()
def change_keywords(request):
	context={}	
	if employee.objects.filter(user=request.user,is_verified=True).exists():
		if request.method == "POST":
			name=request.POST.get("name")
			keyword=request.POST.get("keyword")
			if check_blank_or_null([name,keyword]):
				k=keyword.split("\r\n")

			context['keyword']=f" {name} ".join(k)	
			return render(request,"cms/change_keywords.html",context)	
		else:
			return render(request,"cms/change_keywords.html",context)
