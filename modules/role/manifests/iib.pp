# Docs
class role::iib()
{
  contain profile::base
  contain iib_install::installiib
  contain profile::iib::example
}
