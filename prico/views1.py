from django.shortcuts import render
from django.http import HttpResponse
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
from cms.models import *
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.views import View
import random
from django.conf import settings
from django.core.mail import send_mail
import json
from django.views.decorators.http import require_GET
from django.utils.decorators import method_decorator


# tex_percentage=5
# delivery_charge=20

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



def check_cookies(data):
	status=True
	if custid.objects.filter(uid=data).exists() == False:
		status=False
	else:
		pass
	return status		

def generate_custid(request):
	context={}
	uid=get_random_string(150)
	cust=custid.objects.create(uid=uid)
	cust.save()
	context['userid']=uid
	return JsonResponse(context)

		


@csrf_exempt
def check_custid(request):
	context={}
	if request.method == "POST":
		userid=request.POST.get("userid")
		if custid.objects.filter(uid=userid).exists():
			context['status']="exists"
		else:
			context['status']="notexists"
	else:
		context['status']="getnotallowed"
	return JsonResponse(context)	



def all_header():
	cat=[]
	for z in main_category.objects.all():
		cat1=[z]
		cat2=[]
		for a in category.objects.filter(main_category=z):
			cat2.append(a)
		cat1.append(cat2)
		cat.append(cat1)
	return cat



def login_view(request):
	context={}
	context['off']=offers.objects.all()
	context['head']=all_header()
	context['siteinfo']=site_information.objects.all().first()
	context['sitemain_category']=main_category.objects.all()
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0
	if request.user.is_authenticated:
		return redirect("/")
	if request.method=="POST":
		username=request.POST.get("email")
		password=request.POST.get("password")
		user=authenticate(username=username,password=password)
		if user is not None:
			login(request, user)
			# if customer.objects.filter(user=user).exists():
			return redirect("/")
			context['status']="login successfully"
		else:
			context['status']="email and password is not exists" 
		return render(request,"prico/login.html",context)
	else:
		return render(request,"prico/login.html",context)



def signup(request):
	context={}
	# context['head']=all_header()	
	if request.method == "POST":
		email=request.POST.get('email')
		first_name=request.POST.get('first_name')
		last_name=request.POST.get('last_name')
		password=request.POST.get('password')
		# age=request.POST.get('age')
		# gender=request.POST.get('gender')
		if check_length([[email,100],[first_name,100],[last_name,100],[password,100]]) and check_blank_or_null([email,first_name,last_name,password]) :
			if User.objects.filter(username=email).exists():
				context['status']='email is already exists'	
			else:
				user=User.objects.create_user(username=email,first_name=first_name,last_name=last_name,email=email,password=password)
				# cust=customer.objects.create(user=user)
				# cust.age=age
				# cust.gender=gender
				# cust.save()
				user.save()
				noti=notification.objects.create(user=user)
				noti.subject=" welcome to matsl."
				noti.content=f"welcome to matsl {user.first_name} {user.last_name} .\n\n We hope we will provide you a better service."
				noti.link="/"
				noti.save()
				m=f"welcome to matsl {user.first_name} {user.last_name} .\n\n We hope we will provide you a better service."
				try:
					send_mail( "MATSL -welcome",m , settings.EMAIL_HOST_USER, [user.email,] )
				except:
					context['greeting']=m
				context['status']="Account has been successfully created"
		else:
			context['status']="Data Is not right Format please Insert data Right Format"
		return JsonResponse(context)
	else:
		return JsonResponse({"status":"fail"})



@login_required()
def logout_view(request):
    logout(request)
    return redirect("/")				


def searchxyz(request):
	if 'term' in request.GET:
		p=product.objects.filter(name__icontains=request.GET['term'])
		name=[]
		for x in p:
			name.append(x.name)
		return JsonResponse(name,safe=False)


def index(request):
	context={}
	context['active']="current"
	context['off']=offers.objects.all()
	context['head']=all_header()
	context['siteinfo']=site_information.objects.all().first()
	context['sitemain_category']=main_category.objects.all()
	count=[]
	slid=[]
	cou=0
	for z in slider.objects.all():
		count.append(str(cou))
		slid.append(z)
		cou+=1
	context['slider']=zip(slid,count)
	context['benifit']=benifits.objects.all()
	offer=[]
	for y in offers.objects.all():
		off=[y]
		prod=[]
		img=[]
		price=[]
		actual_price=[]
		save_price=[]
		if offers_product.objects.filter(offers=y).count() > 10:
			for x in offers_product.objects.filter(offers=x)[10]:
				prod.append(x.product)
				actual_price.append(x.product.actual_price)
				price.append(x.product.price)
				save_price.append(x.product.actual_price-x.product.price)
				if image.objects.filter(product=x.product).exists():
					img.append(image.objects.filter(product=x.product)[0].image.url)
				else:
					img.append("https://images.unsplash.com/photo-1516619890133-fa7c582cb796?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80")	
		else:
			for x in offers_product.objects.filter(offers=y):
				prod.append(x.product)
				actual_price.append(x.product.actual_price)
				price.append(x.product.price)
				save_price.append(x.product.actual_price-x.product.price)
				if image.objects.filter(product=x.product).exists():
					img.append(image.objects.filter(product=x.product)[0].image.url)
				else:
					img.append("https://images.unsplash.com/photo-1516619890133-fa7c582cb796?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80")	
		off.append(list(zip(prod,img,price,actual_price,save_price)))
		offer.append(off)
	context['offers']=offer	
	
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
	# 	if check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0
	return render(request,"prico/index.html",context)

def about_us(request):
	context={}
	context['off']=offers.objects.all()
	context['head']=all_header()
	context['siteinfo']=site_information.objects.all().first()
	context['about_us']=aboutus_information.objects.all()
	context['sitemain_category']=main_category.objects.all()
	name=""
	des=""
	for x in aboutus_information.objects.all():
		name+=x.name+"|"
		des+=x.description+"."
	context['about_us_name']=name
	context['about_us_description']=des	
	context['about_us_title']="about us"
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0

	return render(request,"prico/about_us.html",context)



def term_and_conditions(request):
	context={}
	context['off']=offers.objects.all()
	context['head']=all_header()
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()
	context['terms_and_conditions']=terms_and_conditions.objects.all()
	name=""
	des=""
	for x in terms_and_conditions.objects.all():
		name+=x.term+"|"
		des+=x.condition+"."
	context['about_us_name']=name
	context['about_us_description']=des	
	context['about_us_title']="Terms_and Conditions"
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0
	return render(request,"prico/term_and_conditions.html",context)


def contactus(request):
	context={}
	context['off']=offers.objects.all()
	context['head']=all_header()
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()
	context['contactus_title']="Contact Us"
	context['contactus_description']="If you have any query or any problem then just send message"
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0

	if request.method=="POST":
		name=request.POST.get("name")
		message=request.POST.get("message")		
		email=request.POST.get("email")		
		phone=request.POST.get("phone")		
		con_us=	contact_us.objects.create(name=name,message=message,email=email,phone=phone)
		con_us.save()
		context['status']="Your message successfully sent .Your message is very important for us."
		return render(request,"prico/contactus.html",context)
	else:
		return render(request,"prico/contactus.html",context)	


def products(request,url_slug):
	context={}
	context['off']=offers.objects.all()	
	context['siteinfo']=site_information.objects.all().first()
	context['head']=all_header()	
	context['sitemain_category']=main_category.objects.all()
	if category.objects.filter(url_slug=url_slug).exists():
		cat=category.objects.get(url_slug=url_slug)
		prod=[]
		img=[]
		price=[]
		actual_price=[]
		save_price=[]
		for x in product.objects.filter(category=cat,stock=True):
			prod.append(x)
			actual_price.append(x.actual_price)
			price.append(x.price)
			save_price.append(x.actual_price-x.price)
			if image.objects.filter(product=x).exists():
				img.append(image.objects.filter(product=x)[0].image.url)
			else:
				img.append("https://images.unsplash.com/photo-1516619890133-fa7c582cb796?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80")	
		
		prodO=list(zip(prod,img,price,actual_price,save_price))
		page = request.GET.get('page', 1)

		paginator = Paginator(prodO, 200)
		try:
			prodOO = paginator.page(page)
		except PageNotAnInteger:
			prodOO = paginator.page(1)
		except EmptyPage:
			prodOO = paginator.page(paginator.num_pages)
		context['product']=prodOO

		context['cat']=cat
		userid=request.COOKIES.get("userid")
		if check_blank_or_null([userid]) and check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['remember_count']=remember.objects.filter(custid=cust).count()
			if request.user.is_authenticated:
				context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
		else:
			context['cart_count']=0
			context['remember_count']=0	
	else:
		context['status']='category Is not exists'	
	return render(request,'prico/products.html',context)

def search_product(request):
	context={}
	context['off']=offers.objects.all()	
	context['siteinfo']=site_information.objects.all().first()
	context['head']=all_header()
	context['sitemain_category']=main_category.objects.all()
	if request.method == "POST":
		name=request.POST.get("name")
		if check_blank_or_null(name):	
			prod=[]
			img=[]
			price=[]
			actual_price=[]
			save_price=[]
			for x in product.objects.filter(name__icontains=name):
				prod.append(x)
				actual_price.append(x.actual_price)
				price.append(x.price)
				save_price.append(x.actual_price-x.price)
				if image.objects.filter(product=x).exists():
					img.append(image.objects.filter(product=x)[0].image.url)
				else:
					img.append("https://images.unsplash.com/photo-1516619890133-fa7c582cb796?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80")	
			
			prodO=list(zip(prod,img,price,actual_price,save_price))
			page = request.GET.get('page', 1)

			paginator = Paginator(prodO, 200)
			try:
				prodOO = paginator.page(page)
			except PageNotAnInteger:
				prodOO = paginator.page(1)
			except EmptyPage:
				prodOO = paginator.page(paginator.num_pages)
			context['product']=prodOO

			context['cat']={'name':"Search keyword - "+name}
			userid=request.COOKIES.get("userid")
			if check_blank_or_null([userid]) and check_cookies(userid):
				cust=custid.objects.get(uid=userid)
				context['cart_count']=cart.objects.filter(custid=cust).count()
				context['remember_count']=remember.objects.filter(custid=cust).count()
				if request.user.is_authenticated:
					context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
			else:
				context['cart_count']=0
				context['remember_count']=0	
		else:
			context['status']="Product Is not available"		
		return render(request,'prico/products.html',context)
	else:
		return redirect("/")				


def offer(request,url_slug):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()
	context['siteinfo']=site_information.objects.all().first()
	context['sitemain_category']=main_category.objects.all()
	if offers.objects.filter(url_slug=url_slug).exists():
		cat=offers.objects.get(url_slug=url_slug)
		prod=[]
		img=[]
		price=[]
		actual_price=[]
		save_price=[]
		for x in offers_product.objects.filter(offers=cat):
			prod.append(x.product)
			actual_price.append(x.product.actual_price)
			price.append(x.product.price)
			save_price.append(x.product.actual_price-x.product.price)
			if image.objects.filter(product=x.product).exists():
				img.append(image.objects.filter(product=x.product)[0].image.url)
			else:
				img.append("https://images.unsplash.com/photo-1516619890133-fa7c582cb796?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80")	
		prodO=list(zip(prod,img,price,actual_price,save_price))
		page = request.GET.get('page', 1)

		paginator = Paginator(prodO, 200)
		try:
			prodOO = paginator.page(page)
		except PageNotAnInteger:
			prodOO = paginator.page(1)
		except EmptyPage:
			prodOO = paginator.page(paginator.num_pages)
		context['product']=prodOO

		context['cat']=cat
		userid=request.COOKIES.get("userid")
		if check_blank_or_null([userid]) and check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['remember_count']=remember.objects.filter(custid=cust).count()
			if request.user.is_authenticated:
				context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
		else:
			context['cart_count']=0
			context['remember_count']=0	
	else:
		context['status']='category Is not exists'	
	return render(request,'prico/products.html',context)


def categorys(request,url_slug):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()	
	context['siteinfo']=site_information.objects.all().first()
	context['sitemain_category']=main_category.objects.all()
	if main_category.objects.filter(url_slug=url_slug).exists():
		mcat=main_category.objects.get(url_slug=url_slug)
		context['category']=category.objects.filter(main_category=mcat)
		category_keyword=""
		category_description=""
		for x in category.objects.filter(main_category=mcat):
			category_keyword+=x.name+" | "
			category_description=x.description+" . "
		context['main_category_keyword']=category_keyword
		context['main_category_title']=mcat.name
		context['main_category_description']=category_description	

	else:
		context['status']="category is not exists"	
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0	
	return render(request,'prico/category.html',context)	

def product_detail(request,slug_url):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()	
	if product.objects.filter(url_slug=slug_url).exists():
		prod=product.objects.get(url_slug=slug_url)
		context['product']=prod
		context['feature']=feature.objects.filter(product=prod)
		context['feature_exists']="yes" if feature.objects.filter(product=prod).exists() else "no"
		context['side_effect']=side_effect.objects.filter(product=prod)
		context['side_effect_exists']="yes" if side_effect.objects.filter(product=prod).exists() else "no"

		count=0
		for x in image.objects.filter(product=prod):
			context['image'+str(count)]=x.image.url
			count+=1
		context['question']=question.objects.filter(product=prod)
		context['question_exists']="yes" if question.objects.filter(product=prod).exists() else "no"
		rev=review.objects.filter(product=prod).reverse()
		page = request.GET.get('page', 1)
		paginator = Paginator(rev, 100)
		try:
			revO = paginator.page(page)
		except PageNotAnInteger:
			revO = paginator.page(1)
		except EmptyPage:
			revO = paginator.page(paginator.num_pages)
		context['review']=revO
		context['saving']=prod.actual_price-prod.price
		context['review_count']=review.objects.filter(product=prod).count()
		userid=request.COOKIES.get("userid")
		if check_blank_or_null([userid]) and check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['remember_count']=remember.objects.filter(custid=cust).count()
			if request.user.is_authenticated:
				context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
		else:
			context['cart_count']=0
			context['remember_count']=0	
		cat=category.objects.get(name=prod.category)
		if product.objects.filter(category=cat,stock=True).count() < 10:
			prod=[]
			img=[]
			price=[]
			actual_price=[]
			save_price=[]
			for x in product.objects.filter(category=cat,stock=True):
				prod.append(x)
				actual_price.append(x.actual_price)
				price.append(x.price)
				save_price.append(x.actual_price-x.price)
				if image.objects.filter(product=x).exists():
					img.append(image.objects.filter(product=x)[0].image.url)
				else:
					img.append("https://images.unsplash.com/photo-1516619890133-fa7c582cb796?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80")	
			
			prodO=list(zip(prod,img,price,actual_price,save_price))	
			context['productO']=prodO
		else:
			prod=[]
			img=[]
			price=[]
			actual_price=[]
			save_price=[]
			for x in product.objects.filter(category=cat,stock=True)[0:15]:
				prod.append(x)
				actual_price.append(x.actual_price)
				price.append(x.price)
				save_price.append(x.actual_price-x.price)
				if image.objects.filter(product=x).exists():
					img.append(image.objects.filter(product=x)[0].image.url)
				else:
					img.append("https://images.unsplash.com/photo-1516619890133-fa7c582cb796?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=968&q=80")	
			
			prodO=list(zip(prod,img,price,actual_price,save_price))	
			context['productO']=prodO
					
	else:
		context['status']="Product is not exists"
	return render(request,'prico/product_detail.html',context)		

# @login_required()
# def add_product_to_cart(request,pk):
# 	context={}
# 	if product.objects.filter(pk=pk).exists():
# 		prod=product.objects.get(pk=pk)
# 		if cart.objects.filter(product=prod,user=request.user).exists():
# 			context['status']="This Product Is already exists"
# 		c,__=cart.objects.get_or_create(product=prod,user=request.user)
# 		c.save()
# 		return redirect('/product_detail/'+str(prod.pk))
# 	else:
# 		context['status']='product Is not exists'
# 	return render(request,'prico/product_detail.html',context)	



# @login_required()
# def add_products_to_cart(request,pk):
# 	context={}
# 	if product.objects.filter(pk=pk).exists():
# 		prod=product.objects.get(pk=pk)
# 		if cart.objects.filter(product=prod,user=request.user).exists():
# 			context['status']="This Product Is already exists"
# 		c,__=cart.objects.get_or_create(product=prod,user=request.user)
# 		c.save()
# 		return redirect('/products/'+str(prod.category.pk))
# 	else:
# 		context['status']='product Is not exists'
# 	return render(request,'prico/products.html',context)	



def view_cart(request):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()	
	context['siteinfo']=site_information.objects.all().first()
	context['sitemain_category']=main_category.objects.all()
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
	else:
		context['cart_count']=0
		context['remember_count']=0	
	if request.user.is_authenticated:
		context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		crt=[]
		img=[]
		total_item=cart.objects.filter(custid=cust).count()
		total_price=0
		prc_require=False
		context['remember_count']=remember.objects.filter(custid=cust).count()
		for x in cart.objects.filter(custid=cust).reverse():
			if x.product.is_verified == True:
				prc_require=True
			total_price+=x.product.price*x.quantity
			crt.append(x)
			if image.objects.filter(product=x.product).exists():
				img.append(image.objects.filter(product=x.product)[0].image.url)
			else:
				img.append('https://images.unsplash.com/reserve/yra1GBrGTB65qtZpFaly_day%202.jpg?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fG5vJTIwaW1hZ2UlMjBoZXJlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60')	
		context['cart']=zip(crt,img)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['total_item']=total_item
		context['total_price']=total_price
		dch=True
		print(delivery_charge.objects.all().count())
		if int(delivery_charge.objects.all().count())>0:
			for x in delivery_charge.objects.all():
				if x.lowerlimit < total_price and x.upperlimit > total_price:
					context['delivery_charge']=x.price
					context['tex_price']=(x.tex//100)*total_price
					context['tex_percentage']=x.tex
					context['total_bill']=((x.tex//100)*total_price)+x.price+total_price
					dch=False
					print(dch)
				else:
					pass
		else:
			dch=True
		if dch ==True:	
			context['delivery_charge']=0
			context['tex_price']=(0/100)*total_price
			context['tex_percentage']=0
			context['total_bill']=((0//100)*total_price)+0+total_price

		context['prc_require']=prc_require
	return render(request,'prico/view_cart.html',context)


@login_required
def checkout(request):
	context={}
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
	else:
		context['cart_count']=0
		context['remember_count']=0	
	siteinfo=site_information.objects.all().first()
	context['off']=offers.objects.all()	
	context['head']=all_header()	
	context['siteinfo']=site_information.objects.all().first()
	context['sitemain_category']=main_category.objects.all()
	context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	userid=request.COOKIES.get("userid")
	prc_require=False
	if check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		if cart.objects.filter(custid=cust).count() > 0:
			total_price=0
			total_item=0
			for x in cart.objects.filter(custid=cust):
				if x.product.is_verified == True:
					prc_require=True
				else:
					pass
				total_price+=x.product.price	
				total_item+=1
			dch=True
			if int(delivery_charge.objects.all().count())>0:
				for x in delivery_charge.objects.all():
					if x.lowerlimit < total_price and x.upperlimit > total_price:
						context['delivery_charge']=x.price
						context['tex_price']=(x.tex//100)*total_price
						context['tex_percentage']=x.tex
						context['total_item']=total_item
						context['total_price']=total_price
						context['total_bill']=((x.tex//100)*total_price)+x.price+total_price
						dch=False
					else:
						pass
			if dch ==True:	
				context['delivery_charge']=0
				context['tex_price']=(0/100)*total_price
				context['tex_percentage']=0
				context['total_price']=total_price
				context['total_item']=total_item
				context['total_bill']=((0//100)*total_price)+0+total_price
			context['prc_require']=prc_require
		else:
			context['status']="cartempty"
	else:
		return redirect("/")		
	if request.method=="POST":
		location=request.POST.get("location")
		zipcode=request.POST.get("zipcode")
		address=request.POST.get("address")
		mobile=request.POST.get("mobile")
		notes=request.POST.get("notes")
		userid=request.COOKIES.get("userid")
		mode=request.POST.get("mode")
		try:
			prc=request.FILES['prc']
		except:
			prc=""
		prc_require = False 
		if check_blank_or_null([location,zipcode,address,mobile,userid]) and check_length([[location,400],[zipcode,50],[address,400],[mobile,22]]):
			if check_cookies(userid):
				cust=custid.objects.get(uid=userid)
				if cart.objects.filter(custid=cust).count() > 0:
					total_price=0
					for x in cart.objects.filter(custid=cust):
						if x.product.is_verified == True:
							prc_require=True
							
						else:
							pass
						total_price+=x.product.price		
					dch=True
					if int(delivery_charge.objects.all().count())>0:
						for x in delivery_charge.objects.all():
							if x.lowerlimit < total_price and x.upperlimit > total_price:
								delivery_chargeO=x.price
								tex_priceO=(x.tex//100)*total_price
								tex_percentageO=x.tex
								total_bill=((x.tex//100)*total_price)+x.price+total_price
								dch=False
							else:
								pass
					if dch ==True:	
						delivery_chargeO=0
						tex_priceO=(0/100)*total_price
						tex_percentageO=0
						total_bill=((0//100)*total_price)+0+total_price
					if prc_require == True and check_blank_or_null([prc]) == False:
						context['status']="prescription Require in order to complete the order"
						return render(request,'prico/checkout.html',context)	
					o=order.objects.create()
					o.uid=get_random_string(8)
					o.user=request.user
					o.location=location
					o.zipcode=zipcode
					o.address=address
					o.mobile=mobile
					o.notes=notes
					o.tolal_tax=tex_priceO
					o.tolal_item_price=total_price
					o.delivery_charge=delivery_chargeO
					o.amount=((tex_percentageO/100)*total_price)+delivery_chargeO+total_price
					if prc_require == True:
						prcO=prescription.objects.create(order=o)
						prcO.prc1=prc
						prcO.save()
					m_product=[]	
					for x in cart.objects.filter(custid=cust):
						odi=order_item.objects.create(order=o)
						odi.product=x.product
						odi.quantity=x.quantity
						odi.price=x.product.price
						odi.save()
						m_product.append({"name":x.product.name,"brandname":x.product.brandname,"quantity":x.quantity,"price":x.product.price})
						x.delete()	
					o.save()
					mn=f"Hi \n\n Your order has been successfully placed .\nOrder ID:{o.uid}\nAmount: {o.amount}.\nYour order will be arrive as soon possible,Maximum 2-3days.\nBe safe and Stay healthy \n\nRegards \n Suchit Chouhan"
					noti=notification.objects.create(user=request.user)
					noti.subject=f"New order {o.uid}"
					noti.content=f"Hi \n\n Your order has been successfully placed .\nOrder ID:{o.uid}\nAmount: {o.amount}.\nYour order will be arrive as soon possible,Maximum 2-3days.\nBe safe and Stay healthy \n\nRegards \n Suchit Chouhan"
					noti.link="http://ec2-3-14-3-95.us-east-2.compute.amazonaws.com/account"
					noti.save()
					morder=f"Fullname: {request.user.first_name} {request.user.last_name}\nemail: {request.user.email}Order Id: {o.uid}\nZipcode: {o.zipcode}\nAddress: {o.address}\nMobile: {o.mobile}\n"
					morder+=f"Notes: {o.notes}\nTotal tax: {o.tolal_tax}\nTotal item price: {o.tolal_item_price}\n"
					morder+=f"Delivery Charge: {o.delivery_charge}\nAmount: {o.amount}\n\nProduct Details"
					for x in m_product:
						morder+=f"\nProduct name: {x['name']}\nBrandname: {x['brandname']}\nQuantity: {x['quantity']}\nPrice: {x['price']}\n"
					try:
						send_mail(siteinfo.title+" -order placed successfully", mn, settings.EMAIL_HOST_USER, [request.user.email] )
					except:
						print("email error")
					try:	
						send_mail(siteinfo.title+"New order arrive",morder,settings.EMAIL_HOST_USER,list(emailnotification.objects.values_list('email',flat=True)))
					except:
						print("email error")
					context['status']='order is going to delivery within 2-3 day.and Be Safe And Be strong'
			else:
				return redirect("/")
		else:
			context['status']="The is not in right Format"
		return render(request,'prico/checkout.html',context)	
	else:
		return render(request,'prico/checkout.html',context)								


@csrf_exempt
def update_cart(request):
	context={}
	if request.method=="POST":
		pk=request.POST.get("cartid")
		qty=request.POST.get("qty")
		userid=request.POST.get("userid")
		if check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			if cart.objects.filter(pk=pk,custid=cust).exists() and check_blank_or_null([qty]) and qty.isdigit() and int(qty) > 0:
				c=cart.objects.get(pk=pk,custid=cust)
				c.quantity=qty
				c.save()
				context['status']="Cart has been updated and be healthy"
			else:
				context['status']='Data Is not right Format and make yourself fit for everythink'
			crt=[]
			img=[]
			total_item=cart.objects.filter(custid=cust).count()
			total_price=0
			for x in cart.objects.filter(custid=cust).reverse():
				total_price+=x.product.price*x.quantity
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['total_item']=total_item
			context['total_price']=total_price
			dch=True
			if int(delivery_charge.objects.all().count())>0:
				for x in delivery_charge.objects.all():
					if x.lowerlimit < total_price and x.upperlimit > total_price:
						context['delivery_charge']=x.price
						context['tex_price']=(x.tex//100)*total_price
						context['tex_percentage']=x.tex
						context['total_bill']=((x.tex//100)*total_price)+x.price+total_price
						dch=False
					else:
						pass
			else:
				dch=True
			print(dch)	
			if dch ==True:	
				context['delivery_charge']=0
				context['tex_price']=(0//100)*total_price
				context['tex_percentage']=0
				context['total_bill']=((0//100)*total_price)+0+total_price
		else:
			context['status']="usercookies"	
		print(context)		
	return JsonResponse(context)	
					

	

@csrf_exempt
def delete_cart(request):
	context={}
	if request.method=="POST":
		pk=request.POST.get("cartid")
		userid=request.POST.get("userid")
		if check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			if cart.objects.filter(pk=pk,custid=cust).exists():
				c=cart.objects.get(pk=pk,custid=cust)
				c.delete()
				context['status']="success"
			else:
				context['status']='Productisnotexists'
	
			crt=[]
			img=[]
			total_item=cart.objects.filter(custid=cust).count()
			total_price=0
			for x in cart.objects.filter(custid=cust).reverse():
				total_price+=x.product.price*x.quantity
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['total_item']=total_item
			context['total_price']=total_price
			dch=True
			if delivery_charge.objects.all().count()>0:
				for x in delivery_charge.objects.all():
					if x.lowerlimit < total_price and x.upperlimit > total_price:
						context['delivery_charge']=x.price
						context['tex_price']=(x.tex/100)*total_price
						context['tex_percentage']=x.tex
						context['total_bill']=((x.tex//100)*total_price)+x.price+total_price
						dch=False
					else:
						pass
			else:
				dch=True
			if dch ==True:	
				context['delivery_charge']=0
				context['tex_price']=(0/100)*total_price
				context['tex_percentage']=0
				context['total_bill']=((0//100)*total_price)+0+total_price
		else:
			context['status']="usercookiesisnotset"		
	return JsonResponse(context)	
					

	

@csrf_exempt
def add_cart(request):
	context={}
	if request.method=='POST':
		pk=request.POST.get('product_id')
		userid=request.POST.get("userid")
		if check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			if check_blank_or_null([pk,userid]) and product.objects.filter(pk=pk).exists():
				prod=product.objects.get(pk=pk)
				if cart.objects.filter(product=prod,custid=cust).count() > 0:
					context['status']="alreadyexistsoncart"
				else:	
					c=cart.objects.create(product=prod,custid=cust)
					c.save()
					context['status']="success"
			else:
				context['status']="We do not have this product yet but its will we available as soon as possible"
			context['cart_count']=cart.objects.filter(custid=cust).count()	
		else:
			context['status']="Hey do not fuck up with user COOKIES,Dude ITs for user better experience not selling data"
	else:
		context['status']="fail"			
	return JsonResponse(context)


@csrf_exempt
def remember_list(request):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()	
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0	
	rm=remember.objects.filter(custid=cust)
	prod=[]
	img=[]
	for x in rm:
		prod.append(x)
		if image.objects.filter(product=x.product).exists():
			img.append(image.objects.filter(product=x.product)[0].image.url)
		else:
			img.append('https://images.unsplash.com/reserve/yra1GBrGTB65qtZpFaly_day%202.jpg?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fG5vJTIwaW1hZ2UlMjBoZXJlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60')
	context['remember']=zip(prod,img)
	return render(request,'prico/remember_list.html',context)


@csrf_exempt
def add_remember_list(request):
	context={}
	if request.method == "POST":
		product_id=request.POST.get("product_id")
		userid=request.POST.get("userid")
		if check_blank_or_null([userid]) and check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			if check_blank_or_null([product_id]) and product.objects.filter(pk=product_id).exists():
				prod=product.objects.get(pk=product_id)
				if remember.objects.filter(product=prod,custid=cust).exists():
					context['status']="Product Is already In remember List"
				else:
					rm=remember.objects.create(custid=cust,product=prod)
					rm.save()
					context['status']="Product is added in remember List"
			else:
				context['status']="productnotexists"
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['remember_count']=remember.objects.filter(custid=cust).count()	
		else:
			context['status']="fail"
		
	return JsonResponse(context)							

@csrf_exempt
def delete_remember_list(request):
	context={}
	if request.method=="POST":
		pk=request.POST.get("remid")
		userid=request.POST.get("userid")
		if check_blank_or_null([userid]) and check_cookies(userid):
			cust=custid.objects.get(uid=userid)
			if check_blank_or_null([pk]) and remember.objects.filter(pk=pk,custid=cust).exists():
				c=remember.objects.get(pk=pk,custid=cust)
				c.delete()
				context['status']="success"
			else:
				context['status']='Productnotexists'
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['remember_count']=remember.objects.filter(custid=cust).count()	
		else:
			context['status']="fail"
	else:
		context['status']="getmethodisallowed"		

	return JsonResponse(context)









@csrf_exempt
def update_remember_list(request):
	context={}
	if request.method=="POST":
		pk=request.POST.get("remid")
		qty=request.POST.get("qty")
		userid=request.POST.get("userid")
		if check_blank_or_null([userid,pk,qty]) and check_cookies(userid) and qty.isdigit() and int(qty) > 0:
			cust=custid.objects.get(uid=userid)
			if remember.objects.filter(pk=pk,custid=cust).exists() and check_blank_or_null([qty]) and qty.isdigit() and int(qty) > 0:
				c=remember.objects.get(pk=pk,custid=cust)
				c.quantity=qty
				c.save()
				context['status']="Remember List has been updated and be healthy"
			else:
				context['status']='Data Is not right Format and make yourself fit for everythink'
	else:
		context['status']="fail"
	return JsonResponse(context)




@csrf_exempt
def send_remember_to_cart(request):
	context={}
	if request.method=="POST":
		pk=request.POST.get("remid")
		userid=request.COOKIES.get("userid")
		if check_blank_or_null([pk,userid]) and check_cookies(userid) and remember.objects.filter(pk=pk).exists():
			cust=custid.objects.get(uid=userid)
			c=remember.objects.get(pk=pk,custid=cust)
			cc,__=cart.objects.get_or_create(custid=cust,product=c.product)
			cc.quantity=c.quantity
			cc.save()
			context['cart_count']=cart.objects.filter(custid=cust).count()
			context['remember_count']=remember.objects.filter(custid=cust).count()
			context['status']="product has been successfully sended to cart"
		else:
			context['status']="product is not exists in remember list"
	else:
		context['status']="fail"
	return JsonResponse(context)

@csrf_exempt
@login_required()
def account(request):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()
	context['user']=request.user
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()	
	context['order']=order.objects.filter(user=request.user).values()
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0		
	return render(request,'prico/account.html', context)


@csrf_exempt
@login_required()
def order_items(request,pk):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()	
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0	
	if check_blank_or_null([str(pk)]) and order.objects.filter(pk=pk,user=request.user).exists():
		oo=order.objects.get(pk=pk,user=request.user)
		item=[]
		image=[]
		for x in order_item.objects.filter(order=oo):
			item.append(x)
		context['item']=item
		# print(context['item'])
		context['order_uid']=oo.uid
	else:
		context['status']="Order is not exists .Please do some shooping"
	return render(request,'prico/order_items.html', context)



@csrf_exempt
@login_required()
def order_delivery_status(request,pk):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()	
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
		if request.user.is_authenticated:
			context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"
	else:
		context['cart_count']=0
		context['remember_count']=0	
	if check_blank_or_null([str(pk)]) and order.objects.filter(pk=pk,user=request.user).exists():
		oo=order.objects.get(pk=pk,user=request.user)
		context['order_status']=order_status.objects.filter(order=oo).reverse()
		# print(context['item'])
		context['order_uid']=oo.uid
	else:
		context['status']="Order is not exists .Please do some shoping"
	return render(request,'prico/order_delivery_status.html', context)





@csrf_exempt
def post_review(request):
	context={}
	if request.method == "POST":
		prod_id=request.POST.get("prod_id")
		comment=request.POST.get("comment")
		if request.user.is_authenticated:
			if check_blank_or_null([prod_id,comment]) and check_length([[comment,400]]) and product.objects.filter(pk=prod_id).exists():
				rev=review.objects.create(user=request.user)
				rev.product=product.objects.get(pk=prod_id)
				rev.comment=comment
				rev.save()
				context['fullname']=request.user.first_name+" "+request.user.last_name
				context['comment']=comment
				context['status']="Your review has been successfully posted for this medicine"
			else:
				context['status']="Data is not right format"
		else:
			context['status']="login_required"		
	else:
		context['status']="fail"
	return JsonResponse(context)					



class forget_password(View):
	def post(self,request,*args,**kwargs):
		context={}
		email=request.POST.get('email')
		print(email)
		if check_blank_or_null(email) and User.objects.filter(email=email).exists():
			user=User.objects.get(email=email)
			otp=random.randint(10000,100000)
			fpo,__=forget_password_otp.objects.get_or_create(user=user)
			fpo.otp=otp
			fpo.save()
			message=f"Your password Reset Otp is {otp} .Please Do not share with anyone"
			send_mail( "MATSL -Password Reset", message, settings.EMAIL_HOST_USER, [email,] )
			context['status']="successfully "
		else:
			context['status']="fail"

		return JsonResponse(context)
	def get(self,request,*args,**kwargs):
		context={}
		context['head']=all_header()
		context['off']=offers.objects.all()	
		context['sitemain_category']=main_category.objects.all()
		context['siteinfo']=site_information.objects.all().first()
		return render(request,'prico/forget_password.html',context)	


class verify_otp(View):
	def get(self,request,*args,**kwargs):
		context={}
		context['head']=all_header()
		context['off']=offers.objects.all()	
		context['sitemain_category']=main_category.objects.all()
		context['siteinfo']=site_information.objects.all().first()
		return render(request,'prico/forget_password.html',context)
	def post(self,request,*args,**kwargs):
		context={}
		email=request.POST.get("email")
		otp=request.POST.get("otp")
		password=request.POST.get("password")
		print(email,otp,password)
		if check_blank_or_null([email,otp,password]):
			if User.objects.filter(username=email).exists():
				user=User.objects.get(username=email)
				if forget_password_otp.objects.filter(user=user).exists():
					fp=forget_password_otp.objects.get(user=user)
					if fp.otp==otp:
						if fp.attempt < 5:
							user=User.objects.get(username=email)
							user.set_password(password)
							user.save()
							context['status']="Password has been Reset"
						else:
							context['status']="Your 5 attempt worng .Don't try brute force the otp"
							fp=forget_password_otp.objects.get(user=user)	
							fp.delete()
					else:
						context['status']="InCorrect otp"
						fp=forget_password_otp.objects.get(user=user)	
						fp.attempt+=1
						fp.save()	
				else:
					context['status']="InCorrect otp"
					
			else:
				context['status']="user is not exists"
		else:
			context['status']="Data is not in right format"
		return JsonResponse(context)	





class send_otp_for_login(View):
	def post(self,request,*args,**kwargs):
		context={}
		email=request.POST.get('email')
		if check_blank_or_null(email) and User.objects.filter(email=email).exists():
			user=User.objects.get(email=email)
			otp=random.randint(10000,100000)
			fpo,__=otp_login.objects.get_or_create(user=user)
			fpo.otp=otp
			fpo.save()
			message=f"Login OTP {otp}  .Please Do not share with anyone and use for login"
			send_mail( "MATSL -Password Reset", message, settings.EMAIL_HOST_USER, [email,] )
			context['status']="successfully "
		else:
			context['status']="fail"
		return JsonResponse(context)
	def get(self,request,*args,**kwargs):
		context={}
		context['head']=all_header()
		context['off']=offers.objects.all()	
		context['sitemain_category']=main_category.objects.all()
		context['siteinfo']=site_information.objects.all().first()
		return render(request,'prico/login.html',context)	



class login_with_otp(View):
	def get(self,request,*args,**kwargs):
		context={}
		context['off']=offers.objects.all()	
		context['head']=all_header()
		context['sitemain_category']=main_category.objects.all()
		return render(request,'prico/login.html',context)
	@csrf_exempt
	def post(self,request,*args,**kwargs):
		context={}
		email=request.POST.get("email")
		otp=request.POST.get("otp")
		if check_blank_or_null([email,otp]):
			if User.objects.filter(username=email).exists():
				user=User.objects.get(username=email)
				if otp_login.objects.filter(user=user).exists():
					fp=otp_login.objects.get(user=user)
					if fp.otp==otp:
						if fp.attempt < 5:
							user=User.objects.get(username=email)
							login(request,user)
							return redirect("/")
						else:
							context['status']="Your 5 attempt worng .Don't try brute force the otp"
							fp=otp_login.objects.get(user=user)	
							fp.delete()
					else:
						context['status']="InCorrect otp"
						fp=otp_login.objects.get(user=user)	
						fp.attempt+=1
						fp.save()	
				else:
					context['status']="InCorrect otp"
					
			else:
				context['status']="user is not exists"
		else:
			context['status']="Data is not in right format"
			print(context)
		return render(request,'prico/login.html',context)

@login_required()
def usernotification(request):
	context={}
	context['off']=offers.objects.all()	
	context['head']=all_header()
	context['sitemain_category']=main_category.objects.all()
	context['siteinfo']=site_information.objects.all().first()	
	userid=request.COOKIES.get("userid")
	if check_blank_or_null([userid]) and check_cookies(userid):
		cust=custid.objects.get(uid=userid)
		context['cart_count']=cart.objects.filter(custid=cust).count()
		context['remember_count']=remember.objects.filter(custid=cust).count()
	not_seen_noti=notification.objects.filter(user=request.user,seen=False)
	seen_note=notification.objects.filter(user=request.user,seen=True)
	total_noti=not_seen_noti | seen_note
	page = request.GET.get('page', 1)
	paginator = Paginator(total_noti,100)
	try:
		notify = paginator.page(page)
	except PageNotAnInteger:
		notify = paginator.page(1)
	except EmptyPage:
		notify = paginator.page(paginator.num_pages)
	context['notification']=notify
	for x in not_seen_noti:
		x.seen=True
		x.save()
	context['notification_available']="yes" if notification.objects.filter(user=request.user,seen=False).exists() else "no"	
	return render(request, 'prico/notification.html', context)					







@require_GET
def robots_txt(request):
    lines = [
        "User-Agent: *",
	"Sitemap: https://gromdy.com/sitemap.xml",
	"User-Agent:Googlebot",
    ]
    return HttpResponse("\n".join(lines), content_type="text/plain")






def error_404(request, exception):
        data = {}
        context['page_type']="404 Error"
        context['page_des']="Oops! This page Could Not Be Found!"
        context['page_contant']="Sorry bit the page you are looking for does not exist, have been removed or name changed."
        return render(request,'prico/404.html', data)




def error_500(request, exception):
        data = {}
        context['page_type']="500 Error"
        context['page_des']="Oops! There is something worng with server|"
        context['page_contant']="Sorry The Trouble .we can fix the server as soon has possible."
        return render(request,'prico/404e.html', data)

        
