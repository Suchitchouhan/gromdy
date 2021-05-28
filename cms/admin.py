from django.contrib import admin
from .models import *
# Register your models here.\\



@admin.register(vendor)
class vendorAdmin(admin.ModelAdmin):
    list_display = ("user","email", "store", "license",'city','state','zipcode','address','is_verified')
    search_fields = ("store",'license','zipcode', 'is_verified')
    list_filter = ('city','state',)
    def fullname(self,obj):
    	return obj.user.first_name+" "+obj.user.last_name
    def email(self,obj):
    	return obj.user.email



@admin.register(main_category)
class main_categoryAdmin(admin.ModelAdmin):
    list_display = ("name","description", "url_slug")
    search_fields = ("name",)



@admin.register(category)
class categoryAdmin(admin.ModelAdmin):
    list_display = ("name","description", "url_slug",'image','main_category')
    search_fields = ("name",)
    list_filter = ("main_category",)    

# admin.site.register(vendor)
# admin.site.register(main_category)
# admin.site.register(category)

@admin.register(product)
class productAdmin(admin.ModelAdmin):
    list_display = ("name", "stock",'brandname','actual_price','price','category','img_feat_sef_ques','review','is_verified','url_slug','keyword')
    search_fields = ("name",)
    list_filter = ("category",'stock','is_verified')
    def img_feat_sef_ques(self,obj):
        return str(image.objects.filter(product=obj).count())+" || "+str(feature.objects.filter(product=obj).count())+" || "+str(side_effect.objects.filter(product=obj).count())+" || "+str(question.objects.filter(product=obj).count())   

    def review(self,obj):
        return str(review.objects.filter(product=obj).count())    


@admin.register(feature)
class featureAdmin(admin.ModelAdmin):
    list_display = ("product","name","description" )
    search_fields = ("name",)
    list_filter = ("product",)




@admin.register(image)
class imageAdmin(admin.ModelAdmin):
    list_display = ("product","image" )
    list_filter = ("product",)



@admin.register(side_effect)
class side_effectAdmin(admin.ModelAdmin):
    list_display = ("product","name","summery" )
    search_fields = ("name",)
    list_filter = ("product",)




@admin.register(question)
class questionAdmin(admin.ModelAdmin):
    list_display = ("product","ques","answer" )
    search_fields = ("ques",)
    list_filter = ("product",)
# admin.site.register(product)
# admin.site.register(feature)
# admin.site.register(image)
# admin.site.register(side_effect)
# admin.site.register(question)



@admin.register(review)
class reviewAdmin(admin.ModelAdmin):
    list_display = ("product","rate","comment","fullname","email")
    search_fields = ("ques",)
    list_filter = ("product",)
    def fullname(self,obj):
    	return obj.user.first_name+" "+obj.user.last_name
    def email(self,obj):
    	return obj.user.email

# admin.site.register(review)
admin.site.register(employee)

@admin.register(offers)
class offersAdmin(admin.ModelAdmin):
    list_display = ("name","description" ,'url_slug','image','keyword')
    search_fields = ("name",)




@admin.register(offers_product)
class offers_productAdmin(admin.ModelAdmin):
	list_display =('offer_name','offer_description',"productname","description", "stock",'brandname','actual_price','price','category','is_verified')
	list_filter = ("offers",)
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
	def offer_name(self,obj):
		return obj.offers.name	 	
	def offer_description(self,obj):
		return obj.offers.description	 	
							


# admin.site.register(offers)
# admin.site.register(offers_product)


@admin.register(slider)
class sliderAdmin(admin.ModelAdmin):
    list_display = ("name","description" ,'button_name','url_name')
    search_fields = ("name",)


@admin.register(benifits)
class benifitsAdmin(admin.ModelAdmin):
    list_display = ("name","description","image" )
    search_fields = ("name",)

# admin.site.register(slider)
# admin.site.register(benifits)

# Register your models here.
admin.site.register(terms_and_conditions)
admin.site.register(site_information)
admin.site.register(best_category)

