(define (domain gripper-typed)
	(:requirements :strips :typing)

	(:types
		room ball gripper
	)

	(:constants
		left right - gripper
	)

	(:predicates
		(at-robby ?r - room)
		(at ?b - ball ?r - room)
		(free ?g - gripper)
		(carry ?o - ball ?g - gripper)
	)

	(:action pick
		:parameters (?obj - ball ?room - room ?gripper - gripper)
		:precondition (and
			(at ?obj ?room)
			(at-robby ?room)
			(free ?gripper)
		)
		:effect (and
			(carry ?obj ?gripper)
			(not (at ?obj ?room))
			(not (free ?gripper))
		)
	)
	
	(:action drop
		:parameters (?obj - ball ?room - room ?gripper - gripper)
		:precondition (and
			(carry ?obj ?gripper)
			(at-robby ?room)
		)
		:effect (and
			(at ?obj ?room)
			(free ?gripper)
			(not (carry ?obj ?gripper))
		)
	)

	(:action move
		:parameters (?from ?to - room)
		:precondition (and
			(at-robby ?from)
		)
		:effect (and
			(at-robby ?to)
			(not (at-robby ?from))
		)
	)

;	(:action look
;		:parameters (?obj - ball ?room - room ?gripper - gripper)
;		:precondition (and
;			(at-robby ?room)
;			(UNKNOWN (at ?obj ?room))
;		)
;		:effect (and
;			(KNOWN (at ?obj ?room))
;		)
;	)

)