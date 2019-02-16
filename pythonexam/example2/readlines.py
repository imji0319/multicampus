with open('movie_quotes1.txt', 'r') as file:    
    lines = file.readlines()
    line = ''
    for line in lines:
        print(line, end='')