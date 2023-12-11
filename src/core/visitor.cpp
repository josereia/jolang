#include <iostream>

#include "../modules/math_module.hpp"
#include "core.hpp"

namespace Core {
using namespace std;
using namespace Math;

class Visitor : public IVisitor {
 public:
  int integer(IInteger* integer) override {
    cout << integer->getValue() << endl;
    return integer->getValue();
  };

  int binaryOp(IBinaryOp* binaryOp) override {
    auto first = binaryOp->getLeftOprd();
    auto second = binaryOp->getRightOprd();

    first->accept(this);
    second->accept(this);

    return 0;
  };
};
}  // namespace Core