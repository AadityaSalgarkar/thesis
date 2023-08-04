import re
import sys

if len(sys.argv) != 3:
    print('We need two arguments.')
    sys.exit()

inputHandler = open(sys.argv[1], 'r')

mathDictionary = {}
commandDictionary = {}

print('Extracting commands...')
for line in inputHandler:
    mathOperator = re.search('\\\\DeclareMathOperator{\\\\([A-Za-z]*)}{(.*)}', line)
    if mathOperator:
        mathDictionary[mathOperator.group(1)] = mathOperator.group(2)
    newCommand = re.search('\\\\newcommand{\\\\([A-Za-z]*)}{(.*)}', line)
    if newCommand:
        commandDictionary[newCommand.group(1)] = newCommand.group(2)

inputHandler.seek(0)

print('Replacing occurrences...')
outputHandler = open(sys.argv[2],'w')
for line in inputHandler:
    current = line
    for x in mathDictionary:
        current = re.sub('\\\\DeclareMathOperator{\\\\' + x + '}{(.*)}', '', current)
        current = re.sub('\\\\' + x + '(?!\w)', '\\operatorname{' + mathDictionary[x] + '}', current)
    for x in commandDictionary:
        current = re.sub('\\\\newcommand{\\\\' + x + '}{(.*)}', '', current)
        current = re.sub('\\\\' + x + '(?!\w)', commandDictionary[x], current)
    outputHandler.write(current)

print('Done.')

inputHandler.close()
outputHandler.close()
