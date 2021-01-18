## PatternExamples

Demonstrate patterns in SWIFT on simple code

### behavioral patterns - поведеньчиские паттерны
---------
- Цепочка обязанностей (chain of responsibility)
- Команда (command)                      
- Интерпретатор (interpreter)             
- Итератор (iterator)
- Посредник (mediator)                    
- Хранитель (memento)                     
- Наблюдатель (observer)                  
- Состояние (state)
- Стратегия (strategy)                    
- Шаблонный метод (template method)      
- Посетитель (visitor)        

### structural patterns - структурные паттерны
#### Определяют различные сложные структуры, которые изменяют интерфейс уже существующих объектов или его реализацию, позволяя облегчить разработку и оптимизировать программу.
---------

- [Адаптер (adapter)](#adapter)                       
- Мост (bridge)                           
- [Компоновщик (composite)](#composite)                 
- [Декоратор (decorator)](#decorator)                   
- [Фасад (facade)](facade)                          
- Приспособленец (flyweight)              
- [Прокси (proxy)](#proxy)   

### generating patterns - порождающие паттерны
---------
- [Абстрактная фабрика (abstract factory)](#abstract-factory)
- Строитель (builder)                     
- [Фабричный метод (factory method)](#factory-method)        
- Прототип (prototype)
- [Одиночка (singleton)](#singleton)         


<a name="abstract-factory"></a>
### Абстрактная фабрика (abstract factory)
Предоставляет интерфейс для создания семейств взаимосвязанных или взаимозависимых объектов, не специфицируя их конкретных классов. Шаблон реализуется созданием абстрактного класса Factory, который представляет собой интерфейс для создания компонентов системы (например, для оконного интерфейса он может создавать окна и кнопки). Затем пишутся классы, реализующие этот интерфейс.
* Система не должна зависеть от того, как создаются, компонуются и представляются входящие в неё объекты.
* Входящие в семейство взаимосвязанные объекты должны использоваться вместе и вам необходимо обеспечить выполнение этого ограничения.
* Система должна конфигурироваться одним из семейств составляющих её объектов.
* Требуется предоставить библиотеку объектов, раскрывая только их интерфейсы, но не реализацию.

<a name="factory-method"></a>
### Factory Method
Также известен как Виртуальный конструктор — порождающий шаблон проектирования, предоставляющий подклассам интерфейс для создания экземпляров некоторого класса. В момент создания наследники могут определить, какой класс создавать. Иными словами, Фабрика делегирует создание объектов наследникам родительского класса. Это позволяет использовать в коде программы не специфические классы, а манипулировать абстрактными объектами на более высоком уровне.

_Плюсы_

* позволяет сделать код создания объектов более универсальным, не привязываясь к конкретным классам (ConcreteProduct), а оперируя лишь общим интерфейсом (Product)
* позволяет установить связь между параллельными иерархиями классов

_Минусы_

* необходимость создавать наследника Creator для каждого нового типа продукта (ConcreteProduct). Впрочем, современные языки программирования поддерживают конструкции, что позволяет реализовать фабричный метод без иерархии классов Creator

<a name="singleton"></a>
### Singleton
Существует в системе в единственном экземпляре => не может быть повторно создан. Объект, к которому обращаются много объектов. Примеры синглтонов в системе:
```objectivec
[NSUserDefaults standardUserDefaults];
[UIApplication sharedApplication];
[UIScreen mainScreen];
[NSFileManager defaultManager];
```
_Non thread safe_
```objectivec
@implementation Singleton
static Singleton *sharedSingleton_ = nil;
+ (Singleton *)sharedInstance {
    if (sharedSingleton_ == nil) {
        sharedSingleton_ = [[Singleton alloc] init];
    }
    return sharedSingleton_;
}
@end
```
However this is wrong on several levels. Firstly, this isn't thread safe, so what happens if multiple threads all try to access this at the same time? There is no reason 1 thread couldn't be in the middle of allocating the object while the other one is trying to access the object. This is actually what Apple shows in its documentation.
If you must use singletons, use `dispatch_once()`
dispatch_once() solves the problem of safely being able to create a singleton in that (1) it guarantees that the code in the block will only be called once for the lifetime of the application (2) its thread safe as I noted in a previous article and (3) its faster than other methods like using `@synchronize()`,etc...
"If called simultaneously from multiple threads, this function waits synchronously until the block has completed." So you should be writing it like this...

_Thread safe_
```objectivec
+ (MyClass *)singleton {
    static dispatch_once_t pred;
    static MyClass *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[MyClass alloc] init];
        });
        return shared;
}
```

__Criticism:__

1. It violates the single responsibility principle because of its quality of controlling its own creation and lifecycle.
2. It introduces global state to your application. I would say global state is very bad because any code can change its value. So at the time of debugging it's really hard to find which portion of the code has made the current stage of global variable.
3. Singleton is generally a bad idea if you are doing unit testing, and it's generally a bad idea not to perform unit testing.

<a name="adapter"></a>
### Adapter
Шаблон проектирования адаптера преобразует интерфейс класса в другой интерфейс, ожидаемый клиентами. Адаптер позволяет классам работать вместе, что иначе невозможно из-за несовместимых интерфейсов. Он отделяет клиента от класса целевого объекта.


<a name="decorator"></a>

### Decorator
Шаблон декоратора придает дополнительные обязанности объекту динамически. Декораторы предоставляют гибкую альтернативу подклассам для расширения функциональности. Как и подклассы, адаптация шаблона декоратора позволяет включать новое поведение без изменения существующего кода. Декораторы оборачивают объект класса, поведение которого они расширяют. Они реализуют тот же интерфейс, что и объект, который они оборачивают, и добавляют свое собственное поведение либо до, либо после делегирования задачи обернутому объекту. Шаблон декоратора выражает принцип проектирования, согласно которому классы должны быть открыты для расширения, но закрыты для модификации.

_General Comments_

including `NSAttributedString`, `NSScrollView`, `UIDatePicker`.

__Categories or extension__


<a name="proxy"></a>

### Proxy
Шаблон проектирования прокси предоставляет суррогат или заполнитель для другого объекта для управления доступом к этому другому объекту. Этот шаблон используется для создания репрезентативного или прокси-объекта, управляющего доступом к другому объекту, который может быть удаленным, дорогостоящим или нуждающимся в защите. Этот шаблон структурно похож на шаблон декоратора, но служит другой цели; декоратор добавляет поведение к объекту, в то время как прокси контролирует доступ к объекту.

<a name="facade"></a>

### Facade
Шаблон проектирования фасад обеспечивает унифицированный интерфейс к набору интерфейсов в подсистеме. Шаблон определяет интерфейс более высокого уровня, который упрощает использование подсистемы, уменьшая сложность и скрывая связь и зависимости между подсистемами.

<a name="composite"></a>

### Composite

Шаблон проектирования компановщик объединяет связанные объекты в древовидные структуры для представления иерархий "часть-целое". Паттерн позволяет клиентам одинаково относиться к отдельным объектам и композициям объектов.
Шаблон Composite является частью MVC ( модель-представление-контроллер)
