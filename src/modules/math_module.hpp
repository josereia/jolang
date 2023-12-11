#ifndef math_module
#define math_module

namespace Core {
class IVisitor;
};

namespace Math {
class IExpression {
 public:
  virtual int accept(Core::IVisitor* visitor) = 0;
};

class IInteger : public IExpression {
 private:
  int value;

 public:
  virtual int getValue() = 0;
};

class IOperation : public IExpression {
 private:
  int code;

 public:
  virtual int getCode() = 0;
};

class IBinaryOp : public IOperation {
 private:
  IExpression* leftOprd;
  IExpression* rightOprd;

 public:
  virtual IExpression* getLeftOprd() = 0;
  virtual IExpression* getRightOprd() = 0;
};
}  // namespace Math

#endif