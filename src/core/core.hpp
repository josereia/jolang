#ifndef core
#define core

#include "../modules/math_module.hpp"

namespace Core {
class IFactory {
 public:
  virtual Math::IInteger* integer(int value) = 0;
  virtual Math::IBinaryOp* binaryOp(int code,
                                    Math::IExpression* first,
                                    Math::IExpression* second) = 0;
};

class IVisitor {
 public:
  virtual int integer(Math::IInteger* integer) = 0;
  virtual int binaryOp(Math::IBinaryOp* binaryOp) = 0;
};
}  // namespace Core

#endif
