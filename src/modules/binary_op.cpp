#include "../core/core.hpp"
#include "math_module.hpp"

namespace Math {
using namespace Core;

class BinaryOp : public IBinaryOp {
 private:
  int code;
  IExpression* leftOprd;
  IExpression* rightOprd;

 public:
  BinaryOp(int c, IExpression* left, IExpression* right) {
    code = c;
    leftOprd = left;
    rightOprd = right;
  };

  int getCode() override { return code; };
  IExpression* getLeftOprd() override { return leftOprd; };
  IExpression* getRightOprd() override { return rightOprd; };
  int accept(IVisitor* visitor) override { return visitor->binaryOp(this); };
};
}  // namespace Math