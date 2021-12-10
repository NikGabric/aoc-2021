import sys


gamma, epsilon = '', ''
bitCounter = 0
commands = sys.stdin.read().strip().split('\n')


def part1():
    global gamma, epsilon, bitCounter
    for bit in range(len(commands[0])):
        for command in commands:
            if command[bit] == '0':
                bitCounter -= 1
            else:
                bitCounter += 1
        if bitCounter > 0:
            gamma += '1'
            epsilon += '0'
        else:
            gamma += '0'
            epsilon += '1'
        bitCounter = 0

    print("Part 1 solution: ", int(gamma, 2) * int(epsilon, 2))


def calc_O2_rating(cmds):
    table0, table1 = [], []
    for bit in range(len(cmds[0])):
        if len(cmds) == 1:
            break

        for cmd in cmds:
            if cmd[bit] == '0':
                table0.append(cmd)
            else:
                table1.append(cmd)

        if len(table0) > len(table1):
            cmds = table0
        else:
            cmds = table1
        table0, table1 = [], []

    return int(cmds[0], 2)


def calc_CO2_rating(cmds):
    table0, table1 = [], []
    for bit in range(len(cmds[0])):
        if len(cmds) == 1:
            break

        for cmd in cmds:
            if cmd[bit] == '0':
                table0.append(cmd)
            else:
                table1.append(cmd)

        if len(table0) <= len(table1):
            cmds = table0
        else:
            cmds = table1
        table0, table1 = [], []

    return int(cmds[0], 2)


def part2(cmds):
    O2_rating = calc_O2_rating(cmds)
    CO2_rating = calc_CO2_rating(cmds)
    print("Part 2 solution: ", O2_rating * CO2_rating)


def main():
    part1()
    part2(commands)


if __name__ == '__main__':
    main()
