from django.contrib import admin
from django.urls import path
from .views import *
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
	path('',index,name='index'),
	path('login',login_view,name='login'),
	path('signup',signup,name='signup'),
	path('logout_view',logout_view,name='logout_view'),
	path('about_us',about_us,name='about_us'),
	path('contactus',contactus,name='contactus'),
	path('categorys/<str:url_slug>',categorys,name='categorys'),
	path('@@=<str:url_slug>',products,name='products'),
	path('$$=<str:slug_url>',product_detail,name='product_detail'),
	path('offer/<str:url_slug>',offer,name="offer"),
	# path('add_product_to_cart/<int:pk>',add_product_to_cart,name='add_product_to_cart'),
	# path('add_products_to_cart/<int:pk>',add_products_to_cart,name='add_products_to_cart'),
	path('cart',view_cart,name='view_cart'),
	path('update_cart',update_cart,name='update_cart'),
	path("add_cart",add_cart,name="add_cart"),
	path("delete_cart",delete_cart,name="delete_cart"),
	path("remember_list",remember_list,name='remember_list'),
	path("add_remember_list",add_remember_list,name="add_remember_list"),
	path("delete_remember_list",delete_remember_list,name="delete_remember_list"),
	path("update_remember_list",update_remember_list,name="update_remember_list"),
	path('send_remember_to_cart',send_remember_to_cart,name='send_remember_to_cart'),
	path('account',account,name='account'),
	path('order_items/<int:pk>',order_items,name="order_items"),
	path("orderstatus/<int:pk>",order_delivery_status,name="order_delivery_status"),
	path("post_review",post_review,name='post_review'),
	path('search_product',search_product,name='search_product'),
	path("verify_otp",verify_otp.as_view(),name="verify_otp"),
	path("forgetpassword",forget_password.as_view(),name="forget_password"),
	path("term_and_conditions",term_and_conditions,name='term_and_conditions'),
	path("send_otp_for_login",send_otp_for_login.as_view(),name='send_otp_for_login'),
	path("login_with_otp",login_with_otp.as_view(),name='login_with_otp'),
	path("notification",usernotification,name="notification"),
	path("check_custid",check_custid,name="check_custid"),
	path("generate_custid",generate_custid,name="generate_custid"),
	path("searchxyz",searchxyz,name='searchxyz'),
	path("checkout",checkout,name='checkout'),
	path("minus_update_cart",minus_update_cart,name="minus_update_cart"),
	path("minus_update_remember_list",minus_update_remember_list,name="minus_update_remember_list"),
	path("select_state",select_state,name="select_state"),
	path("select_city",select_city,name="select_city"),

]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

