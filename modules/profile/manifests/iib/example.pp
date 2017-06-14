#
# Do all IIB setup required for the example
#
class profile::iib::example()
{
  contain ::profile::iib::example::setup
}
