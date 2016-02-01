unit module Op::Thread::Last;

#| x219e LEFTWARD TWO-HEADED ARROW
sub infix:<↞>(Cool $item is copy, *@forms) is export {
  for @forms -> @form {
    when @form.elems >= 2 { $item = @form[0](|@form[1..*], $item) }
    default { $item = @form[0]($item) }
  }
  return $item;
}

sub infix:«<<-»(Cool $item, *@forms) is export { $item ↞ @forms }
