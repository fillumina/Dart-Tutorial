// All prohibitions are valid only if the class are referred from another
// file/library in the same library everything is always possible.

// forbids implementing the class outside its library
base class BaseClass {}

// forbids extending the class outside its library
interface class InterfaceClass {}

// forbids implementing and extending the class everywhere
final class FinalClass {}

// forbids implementing and extending the class outside its library and makes it
// abstract too
sealed class SealedClass {}

// the class behave as both mixin and class
mixin class MixinClass {}
