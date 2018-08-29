;;; top level variable
(defparameter *nodes* '((living-room (you are in the living-room.
                            a wizard is snoring loudly on the couch.))
                        (garden (you are in a beatiful garden.
                            there is a well in front of you.))
                        (attic (you are in the attic.
                            there is a giant welding torch in the corner.))))

(defparameter *edges* '((living-room (garden west door)
                                     (attic upstairs ladder))
                        (garden (living-room east door))
                        (attic (living-room downstairs ladder))))

(defparameter *objects* '(whiskey bucket frog chain))
;;; global variable to track player location
(defparameter *location* 'living-room)

(defparameter *object-locations* '((whiskey living-room)
                                   (bucket living-room)
                                   (chain garden)
                                   (frog garden)))
;;; find key in list
(defun describe-location (location nodes)
    (cadr (assoc location nodes)))
;;; create the description for a single path
(defun describe-path (edge)
    `(there is a, (caddr edge) going , (cadr edge) from here.))
;;; create the description for multiple pathes
(defun describe-paths (location edges) 
    (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))
;;; list visisble objects from location
(defun objects-at (loc objs obj-locs)
    (labels ((at-loc-p (obj)
                (eq (cadr (assoc obj obj-locs)) loc)))
        (remove-if-not #'at-loc-p objs)))
;;; describe visisble objects
(defun describe-objects (loc objs obj-loc)
    (labels ((describe-obj (obj)
        `(you see a, obj on the floor.)))
    (apply #'append (mapcar #'describe-obj (objects-at loc objs obj-loc)))))

(defun look()
    (append (describe-location *location* *nodes*)
            (describe-paths *location* *edges*)
            (describe-objects *location* *objects* *object-locations*)))

(defun walk (direction)
    (let ((next (find direction
                      (cdr (assoc *location* *edges*))
                      :key #'cadr)))
    (if next
        (progn (setf *location* (car next))
           (look))
        '(you cannot go that way.))))

(defun pickup (object)
    (cond ((member object
                   (objects-at *location* *objects* *object-location*))
           (push (list object 'body) *object-locations*)
            `(your are now carring the ,object))
           (t '(you cannot get that.))))

(defun inventory ()
    (cons 'items- (objects-at 'body *objects* *objects-locations*)))