unit module Op::Thread;

use Op::Thread::First;
use Op::Thread::Last;

sub EXPORT {

  %(Op::Thread::First::EXPORT::DEFAULT::)
    .push(%(Op::Thread::Last::EXPORT::DEFAULT::))

}
