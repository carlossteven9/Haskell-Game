import System.IO
main = do 
    principal_menu

--The next function call the principal menu
principal_menu = do
    --Principal Menu
    print "Welcome to mathKids the place in that you will learn maths playing"
    print "1.-New Game"
    print "2.-Resume Game"
    print "3.- Exit"
    --Get the option selected
    option <- getChar
    print ""
    checker option


--This function checks with option was selected
checker x = do
    if  x == '1' 
        then new_Game
    else if  x == '2' 
        then continue_Game
    else if  x == '3' 
        then exit
    else principal_menu
--new game function -TO DO 
new_Game = do 
    game_menu
-- continue Game function -TO DO
continue_Game = do
    print "Continuar Juego"

-- Sends you to the principal menu
exit = do 
    principal_menu

--Game Menu 
game_menu = do 
    --Game menu
    lifes
    do 
        print "Choose a category: "
        print "1- Multiplication"
        print "2- Combination"
        print "3- Permutation"
        print "4- Powers"
        print "5- Back"
        y <- getChar--tupla vacia
        if  y == '1' 
            then almost_the_game "multiplication"
        else if  y == '2' 
            then almost_the_game "combination"
        else if  y == '3' 
            then almost_the_game "permutation"
        else if  y == '4' 
            then almost_the_game "power"
        else if  y == '5' 
            then principal_menu
        else game_menu

--this function will write the category in the "last_category" file and then 
-- This function will be use in "Continue Game", so if the parameter is "Search",
    --it will search the last category selected and if it doesn't find it it will show the game menu again 
-- it will create the menu "In each game"

almost_the_game nombre_categoria = do 
    lifes
    print ("-"++nombre_categoria++"-")
    print ("What do you want to do, bud?")
    print "1- Learn how to?"
    print "2- Begin with the game"
    print "3- Back"
    c <- getChar
    if c == '1'
        then learn nombre_categoria
    else if c == '2' 
        then begin nombre_categoria
    else if c == '3'
        then game_menu
    else 
        almost_the_game nombre_categoria

learn nombre = do 
    handle <- openFile (nombre ++"_solve.txt") ReadMode
    contents <- hGetContents handle
    putStr (contents ++ "\n")
    hClose handle
    almost_the_game nombre

begin nombre = do 
    lifes 
    let number1 = "5"--Falta generar el numero aleatorio 1
    let number2 = "7"--Falta generar el numero aleatorio 2
    print ("What is the " ++ nombre ++ " of "++ number1 ++" with "++ number2)
    let correct ="35"
    answer <- getLine
    lifes
    if answer == correct
        then 
            print("Yes, that is correct, you are a potential genious")
    else 
        print("I'm sorry bud, that's not the answer. Do you want to: ")  
    almost_the_game nombre
    
--This function show the number of lifes that the player has
lifes = do
    let lifes = "numero de vidas"--Leer del archivo
    print ("**Lifes =" ++lifes++"**")

--implementar las funciones begiin y learn
-- funcion lifes terminarla, haciendo que escriba el archivo 
--empezar a trabajar en la funcion random