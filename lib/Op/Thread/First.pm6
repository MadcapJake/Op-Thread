unit module Op::Thread::First;

#| x21a0 RIGHTWARD TWO-HEADED ARROW
sub infix:<↠>(Cool $item is copy, *@forms) is export {
  for @forms -> @form {
    when @form.elems >= 2 { $item = @form[0]($item, |@form[1..*]) }
    default { $item = @form[0]($item) }
  }
  return $item;
}

sub infix:«->>»(Cool $item, *@forms) is export { $item ↠ @forms }
