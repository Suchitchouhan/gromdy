from django.db import models
from django.contrib.auth.models import User
from cms.models import *
from django.utils.safestring import mark_safe

class delivery_charge(models.Model):
	lowerlimit=models.IntegerField(default=0)
	upperlimit=models.IntegerField(default=0)
	price=models.IntegerField(default=0)
	name=models.CharField(default='',max_length=400)
	tex=models.IntegerField(default=0)
	def __str__(self):
		return self.name



class emailnotification(models.Model):
	email=models.EmailField(default="suppot@email.com",max_length=400)
	def __str__(self):
		return self.email
# Create your models here.

# class customer(models.Model):
# 	user=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
# 	age=models.IntegerField(default=0)
# 	gender=models.CharField(default="nogender",max_length=50)
# 	def __str__(self):
# 		return str(self.pk)+" user: "+self.user.username
class custid(models.Model):
	uid=models.CharField(max_length=200)
	def __str__(self):
		return self.uid


class notification(models.Model):
	user=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
	subject=models.CharField(max_length=400,default="")
	content=models.TextField()
	link=models.URLField()
	seen=models.BooleanField(default=False)
	date = models.DateTimeField(auto_now=True)
	def __str__(self):
		return self.subject


class forget_password_otp(models.Model):
	otp=models.CharField(default="",max_length=10)
	attempt=models.IntegerField(default=0)
	user=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
	def __str__(self):
		return self.user.username

class otp_login(models.Model):
	otp=models.CharField(default="",max_length=10)
	attempt=models.IntegerField(default=0)
	user=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
	def __str__(self):
		return self.user.username


class cart(models.Model):
	custid=models.ForeignKey(custid,on_delete=models.CASCADE,null=True)	
	quantity=models.IntegerField(default=1)
	product=models.ForeignKey(product,on_delete=models.PROTECT,null=True)
	# def __str__(self):
	# 	return self.custid.uid[5]

class remember(models.Model):
	user=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
	custid=models.ForeignKey(custid,on_delete=models.CASCADE,null=True)	
	quantity=models.IntegerField(default=1)
	product=models.ForeignKey(product,on_delete=models.PROTECT,null=True)
	def __str__(self):
		return self.custid.uid




class order(models.Model):
	uid=models.CharField(default="",max_length=60)
	user=models.ForeignKey(User,on_delete=models.PROTECT,null=True)
	country=models.CharField(default="India",max_length=400)
	state=models.CharField(default="",max_length=400)
	city=models.CharField(default="",max_length=400)
	area=models.CharField(default="",max_length=400)
	zipcode=models.CharField(default="",max_length=50)
	address=models.CharField(default="",max_length=400)
	mobile=models.CharField(default="",max_length=22)
	notes=models.TextField(default="")
	date = models.DateTimeField(auto_now=True)
	tolal_tax=models.IntegerField(default=0)
	tolal_item_price=models.IntegerField(default=0)
	delivery_charge=models.IntegerField(default=0)
	amount=models.IntegerField(default=0)
	mode=models.CharField(default="cod",max_length=60)
	status=models.CharField(default='pending',max_length=100)
	is_verify=models.BooleanField(default=True)
	def __str__(self):
		return self.uid


class prescription(models.Model):
	order=models.ForeignKey(order,on_delete=models.CASCADE,null=True)
	prc1=models.ImageField(upload_to='prc',default='noimage.jpg', blank=True, null=True)
	def prc(self):
		return self.order.uid

class order_status(models.Model):
	order=models.ForeignKey(order,on_delete=models.CASCADE,null=True)
	name=models.CharField(default="",max_length=100)
	description=models.CharField(default="",max_length=100)
	date = models.DateTimeField(auto_now=True)
	def __str__(self):
		return self.order.uid

class order_item(models.Model):
	order=models.ForeignKey(order,on_delete=models.CASCADE,null=True)
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	quantity=models.IntegerField(default=0)
	price=models.IntegerField(default=0)
	# def __str__(self):
	# 	return self.order.uid+" - "+self.product.name
