import Window
import Website.Blog.Skeleton as Blog
import Signal exposing (constant, map4)
import Markdown exposing (toElement)
import Graphics.Element exposing (Element, left)

post : Element
post = toElement """
## Programming is Mathematics.

To say otherwise is blasphemous.  Machines engineered from the ground up
exploiting the spin of electrons to light up pixels for our amusement do not
arise through anything other than mathematical processes.  It stands to reason
then, that those machines run a flexible logic to produce results that we call
"computation".  Arbitrary computation powers the world around us.  It enriches
our lives and makes them easier, more fulfilling, more productive.

But computation alone is boring.  Ask any mathematician about the asthetics of
machine-checked proofs and they'll turn dour in an instant.  A proof is
beautiful not because it consists of [20,000
pages](http://en.wikipedia.org/wiki/Classification_of_finite_simple_groups), but
because of the insight the process reveals about the nature of the overall
structure.  Merely brute-forcing our way to insight is profoundly unsatisfying,
and so proofs are not usually done this way.  The larger point is that we can
use computation to arise from the same ashes of profoundly unsatisfying
programs.  Computers don't just mix light beams in patterns, they can store and
move and read and write.  They're dynamic systems that we've been modelling with
static objects and mutation not because it was hard, but because it was easy.
The best most of the programs sitting in your dock or Applications folder can do
are prove ⊥.  Have we learned nothing?

This is why I respect the Functional Programming movement: they get it.
Functional Programmers understand that (at a minimum) 50 years of research and
refinement is a pretty good thing to stake your data types on.  They understand
that composition is more powerful than inheritance (in more ways than one).
They understand that we don't just model [Zygohistomorphic
Prepromorphisms](http://www.haskell.org/haskellwiki/Zygohistomorphic_prepromorphisms)
because it sounded like a fun weeked project.  There's powerful reasoning behind
the structure of Monad and Functor and Folds and Zippers other than ease of use
and monetary interests.  And it is because of these interests that these
structures were able to maintain their semantics through a minimalist approach,
rather than a "cram all the methods into this object" approach.

But there is a larger problem with all of this structure:  grokking it is
*insanely* difficult for the average person.  Now, I'm firmly of the belief that
mathematics itself scares most people off more than the terms, because you don't
really have conversations with your parents about Link-Time Optimizations,
SCRUM, Object-Oriented Programming, or why it's called a [Reference Count not
a Retain Count
dammit](http://clang.llvm.org/docs/AutomaticReferenceCounting.html).  But this
doesn't mean I should take the hyperintellectualist route and stay stuck up in
my own world (with only the Monads to comfort me).  No!  The more people that
know how to deserialize jargon and understand mathematical structures and
actually be able to explain valid use cases, the higher quality of code can be
produced.  Even if that doesn't convince you, it's helpful to at least know what
you're doing so that when someone says that M word, you don't just sit there and
drool, or tune them out because you presume a stream of incomprehensible words
will follow.  Mathematics is the simplest and most precise language mankind has
ever invented, and you should be able to speak it.

To that end, I've decided to start a series on Functional Programming techniques
in Swift to be accompanied by a library, the
[Basis](https://github.com/CodaFi/Swift-Extras), that will grow and serve as
a repository for ideas and a reference for documentation.  Posts presume that
you can program, and have at least *seen* Haskell code, and will build upon
each other.  I will never assume that you know anything you can't find in
plain english buried in the docs of your favorite language (again, unless I have
introduced it in some earlier post).  I should be able to produce about 1 every
few days to for the first few, and it will hopefully slow down and eventually
cease when the repository begins to asymptotically approach the complexity of
[Category-Extras](https://github.com/ekmett/category-extras) (Kidding!).

Finally, please, don't just take my word for it.  The internet is a huge place
full of very reputable sources written by people who have actual degrees and
lots of letters after their names.  [Wikipedia](http://www.wikipedia.org/), the
[nLab](http://ncatlab.org/nlab/show/HomePage), and even
[Google](http://scholar.google.com/) are all excellent sources of information
(the nLab especially).  I cannot, in good conscience, recommend a lot of other
blogs, however.  I find ceaseless metaphors tiring and counterproductive and
confusing, and yet that seems to cover the majority of blog posts.  Please, be
careful and don't waste time on things that purport to explain monads with
burritos or functors with boxes.  Stick to actual mathematics.  You'll have to
learn it eventually, you may as well not cloud your own thinking in the process.

Good luck, and let's make the world a bit less scary.  
"""

main = map4 Blog.generateImagefulPost Window.dimensions (constant "FP In Swift") (constant "http://onenameglobal.com/wp-content/uploads/2014/07/swift-logo-hero.jpg") (constant post)
