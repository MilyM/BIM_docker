import ifcopenshell as ifc


data = ifc.open('231110AC-11-Smiley-West-04-07-2007.ifc')

walls = data.by_type('IfcWall')
walls_number = len(walls)

print(f'Liczba ścian {walls_number}')