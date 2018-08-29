// local variable
(let ((a 5)
     (b 8))
    (+ a b))

// local function
(flet ((f (n) 
          (+ n 10)))
    (f 5))

// define multiple local functions
(flet ((f (n) 
          (+ n 10))
       (g (n) 
          (- n 3)))
    (g (f 5)))

// labels make function names available in defined functions
// fn b calls fn a
(labels ((a (n) 
            (+ n 5))
         (b (n)
            (+ (a n) 6)))
    (b 10))

//Symbol
(eq 'fooo 'FoOo)
//Numbers
(+ 1 1.0)
//strings
(princ "Tutti \"Frutti\" Tutti")

//Data Mode
'(expt 2 3)

//List functions
// cons - link to pieces of Data
(cons 'chicken 'cat)
(cons 'pork (cons 'beef (cons 'chicken ())))
// car - get data from first slot of cell
(car '(pork beef chicken))
// cdr - get data from second slot
(cdr '(pork beef chicken))
// combine car and cdr
(car (cdr '(pork beef chicken)))
(cadr '(pork beef chicken))

//all the same (list function)
(cons 'pork (cons 'beef (cons 'chicken())))
(list 'pork 'beef 'chicken)
'(pork beef chicken)

// nil and () are the same
(cons 'chicken 'nil)
(cons 'chicken ())

// empty list equals false
// Any value not equivalent to an empty list will be considered a true value
(if '() 
    'i-am-true 
    'i-am-false)

// for variants of ()
(eq '() nil) => T
(eq '() ()) => T
(eq '() 'nil) => T

// if
(if (= (+ 1 2) 3) 
    'yup 
    'nope)  
=> YUP

/// code vs data Mode
(+ 1 2)
=> 
3
'(+ 1 2)
=> 
(+ 1 2)

/// quasiquoting with `
(defun describe-path (edge) 
    `(there is a ,(caddr edge) going ,(cadr edge) from here.))

//mapcar - take function and list and apply it to every item
// called higher order functions
(mapcar #'car '((foo bar) (baz qux))) 
=> (foo baz)

// apply takes function and list of objects that items in list are seperate objects
(apply #'append '((mary had) (a) (little lamb)))
=> (MARY HAD A LITTLE LAMB)

// difference print vs prin1 
(progn (print "this") (print "is") (print "a") (print "test"))
=>
"this" 
"is" 
"a" 
"test"

(progn (prin1 "this") (prin1 "is") (prin1 "a") (prin1 "test"))
=>
"this""is""a""test"

(print '3)      => 3        An integer
(print '3.4)    => 3.4      An float
(print 'foo)    => FOO      An symbol (all caps)
(print '"foo") => "foo"     A string
(print '#\a) => #\a         A character

//special literals
#\newline
#\tab
#\space

// use princ to omit "" in data mode
(progn (princ "This sentence will be interrupted") 
        (princ #\newline) 
        (princ "by an annoying newline character."))
=> 
This sentence will be interrupted 
by an annoying newline character.

(defun say-hello () 
    (princ "Please type your name:") 
    (let ((name (read-line))) 
        (princ "Nice to meet you, ") 
        (princ name)))
=>
(say-hello) 
Please type your name: Bob O'Malley 
Nice to meet you, Bob O'Malley

// print writes objects in such a way that the can be always "read" 
// back into ther internal representation
