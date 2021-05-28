from django.contrib import admin
from .models import *
from django.utils.html import format_html
from django.utils.safestring import mark_safe


@admin.register(delivery_charge)
class customerAdmin(admin.ModelAdmin):
    list_display = ("name","price", "lowerlimit", "upperlimit",'tex')
 

@admin.register(forget_password_otp)
class forget_password_otpAdmin(admin.ModelAdmin):
    list_display = ("otp","attempt","fullname","email")
    list_filter = ('attempt', )
    def fullname(self,obj):
    	return obj.user.first_name+" "+obj.user.last_name
    def email(self,obj):
    	return obj.user.email



@admin.register(otp_login)
class otp_loginAdmin(admin.ModelAdmin):
    list_display = ("otp","attempt","fullname","email")
    list_filter = ('attempt', )
    def fullname(self,obj):
    	return obj.user.first_name+" "+obj.user.last_name
    def email(self,obj):
    	return obj.user.email




@admin.register(cart)
class cartAdmin(admin.ModelAdmin):
	list_display =('quantity',"productname", "stock",'brandname','actual_price','price','category','is_verified')
	list_filter = ("product",)
	def productname(self,obj):
		return obj.product.name
	def description(self,obj):
		return obj.product.description
	def brandname(self,obj):
		return obj.product.brandname
	def actual_price(self,obj):
		return obj.product.actual_price
	def price(self,obj):
		return obj.product.price
	def stock(self,obj):
		return obj.product.stock		
	def category(self,obj):
		return obj.product.category
	def is_verified(self,obj):
		return obj.product.is_verified



@admin.register(remember)
class rememberAdmin(admin.ModelAdmin):
	list_display =('fullname','email','quantity',"productname","description", "stock",'brandname','actual_price','price','category','is_verified')
	list_filter = ("product",)
	def productname(self,obj):
		return obj.product.name
	def description(self,obj):
		return obj.product.description
	def brandname(self,obj):
		return obj.product.brandname
	def actual_price(self,obj):
		return obj.product.actual_price
	def price(self,obj):
		return obj.product.price
	def stock(self,obj):
		return obj.product.stock		
	def category(self,obj):
		return obj.product.category
	def is_verified(self,obj):
		return obj.product.is_verified	 	
	def fullname(self,obj):
		return obj.user.first_name+" "+obj.user.last_name	 	
	def email(self,obj):
		return obj.user.email							
@admin.register(order)
class orderAdmin(admin.ModelAdmin):
	list_display=('uid','fullname','email','country','state','city','area','zipcode','address','mobile','notes','date','tolal_tax','tolal_item_price','delivery_charge','amount','mode','status','is_verify')
	list_filter=('date','status')
	search_fields = ("uid",)
	def fullname(self,obj):
		return obj.user.first_name+" "+obj.user.last_name	 	
	def email(self,obj):
		return obj.user.email	
# admin.site.register(customer)
# admin.site.register(cart)
# admin.site.register(remember)

@admin.register(prescription)
class prescriptionAdmin(admin.ModelAdmin):
	list_display = ('prc','uid','address','mobile','date','amount',)
	def uid(self,obj):
		return obj.order.uid
	def zipcode(self,obj):
		return obj.order.zipcode
	def address(self,obj):
		return obj.order.address
	def mobile(self,obj):
		return obj.order.mobile
	def date(self,obj):
		return obj.order.date
	def amount(self,obj):
		return obj.order.amount
		
	
# admin.site.register(order)

# admin.site.register(prescription)

# admin.site.register(order_status)

@admin.register(order_status)
class order_statusAdmin(admin.ModelAdmin):
	list_display = ('name','description','date','order_uid','mobile','date','amount',)
	list_filter = ('date','order')
	def order_uid(self,obj):
		return obj.order.uid
	def mobile(self,obj):
		return obj.order.mobile
	def date(self,obj):
		return obj.order.date
	def amount(self,obj):
		return obj.order.amount


# admin.site.register(order_status)..


@admin.register(order_item)
class order_itemAdmin(admin.ModelAdmin):
	list_display =("productname",'product_price','is_verified','quantity','price','order_uid','date','amount')
	list_filter = ("product",'order')
	def productname(self,obj):
		return obj.product.name
	# def description(self,obj):
	# 	return obj.product.description
	def brandname(self,obj):
		return obj.product.brandname
	def actual_price(self,obj):
		return obj.product.actual_price
	def product_price(self,obj):
		return obj.product.price
	def stock(self,obj):
		return obj.product.stock		
	def category(self,obj):
		return obj.product.category
	def is_verified(self,obj):
		return obj.product.is_verified
	def order_uid(self,obj):
		return mark_safe("<a herf='/admin//prico/order/'"+str(obj.order.pk)+"/change/>"+obj.order.uid+"</a>")
	def date(self,obj):
		return obj.order.date
	def amount(self,obj):
		return obj.order.amount		



@admin.register(aboutus_information)
class aboutus_informationAdmin(admin.ModelAdmin):
    list_display = ("name","description","image")
    



@admin.register(contact_us)
class contact_usAdmin(admin.ModelAdmin):
	list_display = ('name','message','email','phone','date')
	list_filter = ('date',)
	search_fields = ('name','email','phone')


@admin.register(notification)
class notificationAdmin(admin.ModelAdmin):
	list_display = ('fullname','email','subject','link','seen','date')
	list_filter = ('subject','seen','date')
	search_fields = ('subject',)

	def fullname(self,obj):
		return obj.user.first_name+" "+obj.user.last_name	 	
	def email(self,obj):
		return obj.user.email

admin.site.register(custid)
admin.site.register(emailnotification)
