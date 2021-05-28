from django.contrib import admin
from django.urls import path
from .views import *
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
	# path("",login_view,name='cms_login'),
	path('',index,name='cms_index'),
	path('logout',logout_view,name='cms_logout'),
	path('view_product',view_product,name='view_product'),
	path('add_product',add_product,name='add_product'),
	path('update_product/<str:pk>',update_product,name='update_product'),
	path('delete_product',delete_product,name='delete_product'),
	path('add_feature',add_feature,name='add_feature'),
	path('delete_feature',delete_feature,name='delete_feature'),
	path('add_image/<int:pk>',add_image,name='add_image'),
	path('delete_image',delete_image,name='delete_image'),
	path('add_side_effect',add_side_effect,name='add_side_effect'),
	path('delete_side_effect',delete_side_effect,name='delete_side_effect'),
	path('add_question',add_question,name='add_question'),
	path('delete_question',delete_question,name='delete_question'),
	path("view_review/<int:pk>",view_review,name="view_review"),
	path("view_order",view_order,name="view_order"),
	path("order_items/<str:uid>",order_items,name="order_items"),
	path("change_status/<str:uid>",change_status,name="change_status"),
	path("view_user",view_user,name="view_user"),
	path("view_order_by_user/<str:email>",view_order_by_user,name="view_order_by_user"),
	path("view_contactus_request",view_contactus_request,name="view_contactus_request"),
	path("change_keywords",change_keywords,name="change_keywords"),
	# path("view_image/<int:pk>",view_image,name="view_image"),

]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

