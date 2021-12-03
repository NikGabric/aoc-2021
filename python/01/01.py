import sys


depths = sys.stdin.read().split('\n')
depths = [int(el) for el in depths]
count = 0

for i in range(len(depths)-3):
	window1 = sum(depths[i:i+3])
	window2 = sum(depths[i+1:i+4])
	print(window1, window2)
	if (window1 < window2):
		count += 1

print(count)
