#include "../core/core.hpp"
#include "math_module.hpp"

namespace Math {
using namespace Core;

class Integer : public IInteger {
 private:
  int value = 0;

 public:
  Integer(int v) { value = v; };

  int getValue() override { return value; };
  int accept(IVisitor* visitor) override { return visitor->integer(this); };
};
}  // namespace Math