extends Node2D

"""
Mecanica de gachapon
Nota debido al metodo de generacion de numeros que no esta pulido las proporciones
de probabilidad no seran muy correctas
By Ignel
"""

func premio():
	var random = num_rand(49733,27749,randi() % 51 + 10,4)
	print(random)
	if random <= 0.9500 and random >0.5000:# 45%
		var ob = num_rand(49733,3847,randi() % 51 + 10, 4)
		ob = del_punto(ob)
		ob = num_mid(ob,1)
		match ob:# probabilidad de 1/10, 10%
			1:
				print("1_1")
				$Lbl_Premio.text = "Premio 1_1"
			2:
				print("1_2")
				$Lbl_Premio.text = "Premio 1_2"
			3:
				print("1_3")
				$Lbl_Premio.text = "Premio 1_3"
			4:
				print("1_4")
				$Lbl_Premio.text = "Premio 1_4"
			5:
				print("1_5")
				$Lbl_Premio.text = "Premio 1_5"
			6:
				print("1_6")
				$Lbl_Premio.text = "Premio 1_6"
			7:
				print("1_7")
				$Lbl_Premio.text = "Premio 1_7"
			8:
				print("1_8")
				$Lbl_Premio.text = "Premio 1_8"
			9:
				print("1_9")
				$Lbl_Premio.text = "Premio 1_9"
	elif random <= 0.5000 and  random >0.1500:# 35%
		print("Objeto raro")
		var ob = num_rand(49733,3847,randi() % 51 + 10, 4)
		ob = del_punto(ob)
		ob = num_mid(ob,1)
		match ob:# probabilidad de 1/10, 10%
			1:
				print("2_1")
				$Lbl_Premio.text = "Premio 2_1"
			2:
				print("2_2")
				$Lbl_Premio.text = "Premio 2_2"
			3:
				print("2_3")
				$Lbl_Premio.text = "Premio 2_3"
			4:
				print("2_4")
				$Lbl_Premio.text = "Premio 2_4"
			5:
				print("2_5")
				$Lbl_Premio.text = "Premio 2_5"
			6:
				print("2_6")
				$Lbl_Premio.text = "Premio 2_6"
			7:
				print("2_7")
				$Lbl_Premio.text = "Premio 2_7"
			8:
				print("2_8")
				$Lbl_Premio.text = "Premio 2_8"
			9:
				print("2_9")
				$Lbl_Premio.text = "Premio 2_9"
	elif random < 0.1500 and random > 0.0000:# 15%
		print("Objeto muy raro")
		var ob = num_rand(49733,3847,randi() % 51 + 10, 4)
		ob = del_punto(ob)
		ob = num_mid(ob,1)
		print(ob)
		match ob:# probabilidad de 1/10, 10%
			1:
				print("3_1")
				$Lbl_Premio.text = "Premio 3_1"
			2:
				print("3_2")
				$Lbl_Premio.text = "Premio 3_2"
			3:
				print("3_3")
				$Lbl_Premio.text = "Premio 3_3"
			4:
				print("3_4")
				$Lbl_Premio.text = "Premio 3_4"
			5:
				print("3_5")
				$Lbl_Premio.text = "Premio 3_5"
			6:
				print("3_6")
				$Lbl_Premio.text = "Premio 3_6"
			7:
				print("3_7")
				$Lbl_Premio.text = "Premio 3_7"
			8:
				print("3_8")
				$Lbl_Premio.text = "Premio 3_8"
			9:
				print("3_9")
				$Lbl_Premio.text = "Premio 3_9"
	else:# 5%
		print("Demasiado raro")
		var ob = num_rand(49733,3847,randi() % 51 + 10, 4)
		ob = del_punto(ob)
		ob = num_mid(ob,1)
		match ob:# probabilidad de 1/10, 10%
			1:
				print("4_1")
				$Lbl_Premio.text = "Premio 4_1"
			2:
				print("4_2")
				$Lbl_Premio.text = "Premio 4_2"
			3:
				print("4_3")
				$Lbl_Premio.text = "Premio 4_3"


func _on_btn_palanca_pressed():
	print("Pressed")
	var tw = create_tween().set_parallel().set_trans(Tween.TRANS_CUBIC)
	tw.tween_property($Spr_palanca, "rotation_degrees",
				180.0,1.0).as_relative().set_ease(Tween.EASE_OUT)
	$Sfx_maquina.play()
	await  get_tree().create_timer(2.74).timeout
	$Sfx_pop.play()
	tw.chain()
	premio()

func num_rand(x0: int,x1: int,n: int,k: int):#Generador de numeros aleatorios
	var num2: int
	var res: float
	for i in range(n):
		res = x0+x1*2*x0/x1
		match k:
			3:
				x1 = x0
				x0 = num_mid(res,3)
				res = float(x0/1000.0)
			4:
				x1 = x0
				x0 = num_mid(res,4)
				res = float(x0/10000.0)
			5:
				x1 = x0
				x0 = num_mid(res,5)
				res = float(x0/100000.0)
		num2 = res
	return res

func num_mid(numero: int,len_number: int):#Funcion para obtener los numeros del medio
	var x_int: int = numero
	var x_str: String = str(x_int)
	var length: int = len(x_str)
	var middle_str: String = x_str.substr(length/2-2, len_number)
	var middle_int: int = middle_str.to_int()
	return middle_int

func del_punto(num: float):#Elimina el punto decimal
	var str_num: String = str(num)
	var sin_cero: String = str_num.substr(2)
	var final: int = sin_cero.to_int()
	return final 
