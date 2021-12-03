import sys


commands = sys.stdin.read().split('\n')
commands = [[command.split()[0], int(command.split()[1])] for command in commands]

horpos, depth, aim = 0, 0, 0

for command in commands:
	direction = command[0]
	length = command[1]

	if direction == 'forward':
		horpos = horpos + length
		depth = depth + aim*length
	elif direction == 'up':
		aim = aim - length
	elif direction == 'down':
		aim = aim + length

print(depth*horpos)
