from django.contrib.sitemaps import Sitemap
from django.shortcuts import reverse
from cms.models import *



class StaticViewSitemap(Sitemap):
	changefreq = 'weekly'
	def items(self):
		return ['login','about_us','contactus','term_and_conditions','index']
	def location(self, item):
		return reverse(item)


class ProductViewSitemap(Sitemap):
	changefreq = "weekly"
	def items(self):
		return product.objects.all().order_by("-id")
	
	def location(self,obj):
		return f"/$$={obj.url_slug}"



class ProductsViewSitemap(Sitemap):
	changefreq = "weekly"
	def items(self):
		return category.objects.all()
	
	def location(self,obj):
		return f"/@@={obj.url_slug}"



class OfferViewSitemap(Sitemap):
	changefreq = "weekly"
	def items(self):
		return offers.objects.all()
	
	def location(self,obj):
		return f"/offer/{obj.url_slug}"



class categoryViewSitemap(Sitemap):
	changefreq = "weekly"
	def items(self):
		return main_category.objects.all()
	
	def location(self,obj):
		return f"/categorys/{obj.url_slug}"
