import Window
import Website.Blog.Skeleton as Blog
import Signal exposing (constant, map3)
import Markdown exposing (toElement)
import Graphics.Element exposing (Element, left)

post : Element
post = toElement """
## Introduction

We have all seen our fair share of masterpieces on Dribbble, Behance, and the
like.  Those apps that really get us salivating, that really display some
extremely high level of creativity, finish, and innovation are the ones that end
up splashing onto the front page of Hacker News and getting 'aqu-hired' for
millions.  They're supposed to be the forefront of what software development can
do to enhance our lives and the lives of those around us.  So, why then, are
   they all so bad at error handling?

Many applications include some notion of error-handling, whether that be in the
form of modal dialogs, banners, icons, extra screens, etc ., but they all share
one common characteristic: they suck at showing them.  Error generation and
presentation has always been an afterth ought from both a design and programming
standpoint.  The highest level of abstraction for the error itself is the
exception, and the con ventions for their use remains fractured along language
boundaries.  Even languages as high-level has Haskell couldn't rethink the
except ion, rather they provide constructs that bandy the error around into
different chains of responsibility.  As for design, iteration on error
presentation has all but halted for no apparent reason (other than the fact that
nobody ever remembers the guy who designed the error dialogs).  To be clear, I'm
not demanding that all error pages, dialogs, and icons be as thought-out and
overdone as the application they are bound to, but rather that in deciding to
present errors, you have taken on the responsibility of doing so judiciously.

## 404, Design Not Found

Fundamentally an error represents a mistake in logic.  In the context of an
application, an error represents a mistake in program logic o r execution, and
can be divided into two kinds:  Those applicable to the user (actionable
errors), and those applicable to the program (a pplication errors).  Actionable
errors are the only kind that should be presented to the user under normal
circumstances, and hopefully n ot at all.  When a program cannot resolve some
bit of state, or requires outside interaction to begin doing its job again, the
user must be presented with some fork in the road.  This means that errors
should not be presented for the sake of showing errors.  If the error is not
actionable, or deals with hidden state (application errors) don't inform the
user.  Further, if that piece of state is unresolvable without further action,
then it may be presented modally.  Modal dialogs are a *last resort*, and
should always be regarded as such.  They are not a means of presenting
messages, they are a means of distraction from the task at hand, and that
distraction had better be impor tant, informative, and reasonable.  

For all other kinds of errors, there are a myriad of ways of getting the
user's attention.  These kinds of actionable errors can be divid ed further
into two camps: visible and invisible.  If an error interrupts expected
program behavior, it's best to notify the user that th e error has occured,
and what steps can be taken to mitigate or solve the problem.  All other
errors should be invisible or take up as little space as possible.

These all seem to be obvious points to some extent, but there appears to be not
only a lack of consistency, but a lack of understanding about them.  Designers
pay too little attention to the UI and UX of errors, and developers assume the
user is as knowledgeable as they are in whatever language they happen to be
using.  In reality, most users only care about the illusion of progress, and it
can be provided even when errors must be shown.  Such is the reason why the
spinning beachball of death was written, or why indeterminate progress bars seem
to get a new facelift every year.  

## The Error Code

I propose a new way of classifying what meaningful errors actually are so that
they can be presented to the user in an appropriate and ac tionable way.  

Catastrophic errors (those errors that cannot be recovered from) must be
immediately and loudly presented to the user if and only if the component that
must terminate is *critical* to the functionality of the system.  Taking that
into consideration, Microsoft Windows' BSOD can actually be praised for being an
appropriate method for error display, however it comes nowhere near to being
*meaningful* to the end -user.  Mac OS X kernel panics, by contrast, present the
user with a clear and straightforward resolution to a serious problem: That the
computer must be reset.  It even presents the error in a number of common
languages to aid international users.  The reasoning behind suc h intrusive
errors is clear: the system cannot, or should not, recover from a given
component failure, and so the user should do the logi cal thing and restart
their system at the cost of lost work hours.  That said, there have always been
applications that violate these rul es.  Games like Chess.app and Words With
Friends, even company-sanctioned apps like the App Store and iTunes that are
renowned for closin g themselves when they cannot establish a stable internet
connection.  This is simply unacceptable.  When an application cannot function
because it requires a persistent connection to the internet, it should be
clearly explained as such.  It should become immediately obviou s to a user
presented with an empty store screen or game canvas that the application cannot
continue to function normally, and they shoul d be given the opportunity to quit
it themselves.  If a program must self-terminate make it clear to the user that
it is doing so.  Simpl y presenting a modal dialog or submitting a local
notification to the system queue is not enough for important processes. (I
should hardl y think anyone would want to see the OS X window server present
a growl notification of its impending death!)

Major errors (those requiring user action) such as an inability to reach
a particular content server or a failed plugin load should be pr esented modally
to the user if and only if the application cannot perform its main duties until
the error has been resolved.  The importa nt thing to remember about these kinds
of errors is that they can actually be fixed by the user's doing something.  If
an application can not load a plugin, prompt the user to refresh the page.  If
it cannot download a required file, prompt the user to find a more stable int
ernet connection.  If, however, a modal dialog is presented simply because
a parser failed, or a short-lived re-queueable operation faile d, then this
indicates a serious error in program design.  Such errors are unactionable, and
qualify as application-logic errors.

Logic errors (those specific to the program at hand or one of its dependencies)
should *never* be shown to the user unmodified.  There is absolutely no reason
a user should care about your shoddy craftsmanship, nor should they have to ever
get a glimpse into the unfortunate maw of your error-chaining mechanism.  Error
codes should be converted to *meaningful* and actionable descriptions and should
be present ed as discreetly as possible.  A good example of this is hitting API
limits.  A good program that hits an API limit should alert the user with
a non-intrusive banner that the application can no longer request content for
the day, apologize for the inconvenience, and present a helpful document or link
as to why the error has occurred if necessary.  It should *not* attempt to
present a modal dialog containing a raw error code, an error description
specific to a framework or library, or one that is unactionable.  A simple rule
of thumb is to kee p them to yourself and cover all your bases in regards to
error handling so one doesn't happen to slip through only to waste the user's
time.

Minor errors (all others) should *never* be presented to the user.  The same
rules about application logic errors apply double to this cl ass of errors.
The user should never have to deal with a recoverable exception, the failure
of a re-queueable operation, the inability t o reach a given branch in an
if-statement, and whatever trivial byte-vomit happened to get pushed into
production.  Nobody wants to see y our mistakes, least of all you.  Fix it.

## Stop

So, before you go to submit that new email client you've been working on, or
that new reddit clone you're sure will become the new and lasting hotness, stop
and think about how, why, and where errors will be shown.  If you honestly
cannot answer those questions, rethink your
design.  Please, for my sake and yours, stop
ignoring error handling!
"""

main = map3 Blog.generatePost Window.dimensions (constant "Error Handling") (constant post)
