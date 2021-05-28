from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class vendor(models.Model):
	user=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
	store=models.CharField(default="Nostore",max_length=400)
	license=models.CharField(default="Nolicense",max_length=400)
	city=models.CharField(default="NOcity",max_length=200)
	state=models.CharField(default="NoStore",max_length=200)
	zipcode=models.CharField(default="NoZipcode",max_length=200)
	address=models.CharField(default="noAddress",max_length=320)
	is_verified=models.BooleanField(default=False)
	summery=models.TextField(default="")
	def __str__(self):
		return self.store

class employee(models.Model):
	user=models.ForeignKey(User,on_delete=models.CASCADE,null=True)
	is_verified=models.BooleanField(default=False)
	def __str__(self):
		return self.user.username


class main_category(models.Model):
	name=models.CharField(default="noName",max_length=100)
	description=models.TextField(default="description")
	url_slug= models.SlugField(max_length=400,null=True)	
	def __str__(self):
		return self.name

class category(models.Model):
	main_category=models.ForeignKey(main_category,on_delete=models.CASCADE,null=True)
	name=models.CharField(default="Noname",max_length=100)
	description=models.TextField(default="description")
	url_slug= models.SlugField(max_length=400,null=True)
	image=models.ImageField(default="noimage.jpg",upload_to='category')
	keyword=models.TextField(default='rootmed')

	def __str__(self):
		return self.name

class product(models.Model):
	name=models.CharField(default="noproduct",max_length=200)
	description=models.TextField(default="noDesciption")
	stock=models.BooleanField(default=True)
	brandname=models.CharField(default="nobrandname",max_length=200)
	actual_price=models.IntegerField(default=0)
	price=models.IntegerField(default=0)
	category=models.ForeignKey(category,on_delete=models.CASCADE,null=True)
	is_verified=models.BooleanField(default=False)
	url_slug= models.SlugField(max_length=400,null=True)
	keyword=models.TextField(default='rootmed')
	def __str__(self):
		return self.name

class feature(models.Model):
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	name=models.CharField(default="noName",max_length=100)
	description=models.TextField(default="noDesciption")
	def __str__(self):
		return self.name
class image(models.Model):
	image=models.ImageField(upload_to='product',default='noimage.jpg', blank=True, null=True)
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	def __str__(self):
		return self.image.url


class side_effect(models.Model):
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	name=models.CharField(default="Noeffect",max_length=200)
	summery=models.TextField(default='Nosummery')
	def __str__(self):
		return self.name
class question(models.Model):
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	ques=models.CharField(default="NoQuestion",max_length=100)
	answer=models.TextField(default="NoAnswer")
	def __str__(self):
		return self.product.name		

class review(models.Model):
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	rate=models.IntegerField(default=1)
	comment=models.TextField(default="Nocomment")
	user=models.ForeignKey(User,on_delete=models.PROTECT,null=True)
	def __str__(self):
		return self.comment+" - "+str(self.rate)


class available(models.Model):
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	vendor=models.ForeignKey(vendor,on_delete=models.CASCADE,null=True)
	def __str__(self):
		return self.product.name+' -- '+self.vendor.store


class offers(models.Model):
	name=models.CharField(default="Noname",max_length=100)
	description=models.TextField(default="description")
	url_slug= models.SlugField(max_length=400,null=True)
	image=models.ImageField(default="noimage.jpg",upload_to='offers')
	keyword=models.TextField(default='rootmed')	
	def __str__(self):
		return self.name


class offers_product(models.Model):
	offers=models.ForeignKey(offers,on_delete=models.CASCADE,null=True)
	product=models.ForeignKey(product,on_delete=models.CASCADE,null=True)
	def __str__(self):
		return self.offers.name



class slider(models.Model):
	name=models.CharField(default="",max_length=100)
	description=models.TextField(default="")
	button_name=models.CharField(default="",max_length=80)
	image=models.ImageField(default="noimage.jpg",upload_to='slider')	
	url_name = models.URLField(max_length=400,default="")
	def __str__(self):
		return self.name



class benifits(models.Model):
	name=models.CharField(default="",max_length=100)
	description=models.TextField(default="")
	image=models.ImageField(default="noimage.jpg",upload_to='benifits')
	def __str__(self):
		return self.name



class aboutus_information(models.Model):
	name=models.CharField(default="aboutus",max_length=300)
	description=models.TextField(default="")
	image=models.ImageField(default="noimage.jpg",upload_to='benifits')
	def __str__(self):
		return self.name


class contact_us(models.Model):
	name=models.CharField(default="aboutus",max_length=300)
	message=models.TextField(default="")
	email=models.CharField(default="",max_length=400)
	phone=models.CharField(default="",max_length=100)
	date = models.DateTimeField(auto_now=True)
	def __str__(self):
		return self.name



class terms_and_conditions(models.Model):
	term=models.CharField(default="",max_length=400)
	condition=models.TextField()
	def __str__(self):
		return self.term


class site_information(models.Model):
	title=models.CharField(default="MADSL",max_length=100)
	description=models.TextField()
	info1=models.TextField()
	info2=models.TextField()
	address=models.CharField(default="",max_length=400)
	email=models.EmailField(default="support@gmail.com",max_length=400)
	admin_email=models.EmailField(default="support@gmail",max_length=400)
	image=models.ImageField(default="noimage.jpg",upload_to='siteinfo')
	mobile=models.CharField(default="0000000",max_length=20)
	def __str__(self):
		return self.title



class best_category(models.Model):
	category=models.OneToOneField(category,on_delete=models.CASCADE)
	def __str__(self):
		return self.category.name