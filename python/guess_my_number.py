big = 100
small = 1

def guess_my_number():
    return (big + small) // 2

def smaller():
    global big
    big = guess_my_number() - 1
    return guess_my_number()

def bigger():
    global small
    small = guess_my_number() + 1
    return guess_my_number()

def reset():
    global small, big
    big = 100
    small = 1
    guess_my_number()


