#include "../modules/binary_op.cpp"
#include "../modules/integer.cpp"
#include "../modules/math_module.hpp"
#include "core.hpp"

namespace Core {
using namespace Math;

class Factory : public IFactory {
 public:
  IInteger* integer(int value) override {
    IInteger* expr = new Integer(value);
    return expr;
  };

  IBinaryOp* binaryOp(int code,
                      IExpression* first,
                      IExpression* second) override {
    IBinaryOp* op = new BinaryOp(code, first, second);
    return op;
  };
};
}  // namespace Core