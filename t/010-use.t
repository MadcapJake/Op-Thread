use Test;
use lib 'lib';

use-ok 'Op::Thread', "module can be used";

use Op::Thread::First;
use Op::Thread::Last;

sub plus($x, $y) { $x + $y }
sub add1($x) { $x + 1 }
sub multi-add(*@nums) { [+] @nums }

is 1 ↠ [
  [&plus, 2],
  [&add1],
  [&multi-add, 1, 2, 3],
  [&infix:</>, 10]
], 1, 'threads argument first in series of sub calls';

is &infix:«->>»(1, [
  [&plus, 2],
  [&add1],
  [&multi-add, 1, 2, 3],
  [&infix:</>, 10]
]), 1, 'thread-first texas style...sorta';

is 1 ↞ [
  [&plus, 2],
  [&add1],
  [&multi-add, 1, 2, 3],
  [&infix:</>, 1]
], 0.1, 'threads argument last in series of sub calls';

is 1 <<- [
  [&plus, 2],
  [&add1],
  [&multi-add, 1, 2, 3],
  [&infix:</>, 1]
], 0.1, 'thread-last texas style';

done-testing;
