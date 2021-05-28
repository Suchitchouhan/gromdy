from django.db import models

# Create your models here.
class state(models.Model):
	name=models.CharField(max_length=200,default="")
	def __str__(self):
		return self.name

class city(models.Model):
	name=models.CharField(max_length=200,default="")
	state=models.ForeignKey(state,on_delete=models.CASCADE,null=True)
	def __str__(self):
		return self.name

class area(models.Model):
	name=models.CharField(max_length=200,default="")
	city=models.ForeignKey(city,on_delete=models.CASCADE,null=True)
	def __str__(self):
		return self.name

