## PatternExamples

Demonstrate patterns in SWIFT on simple code

### behavioral patterns - поведеньчиские паттерны
---------
Определяют взаимодействие между объектами, увеличивая таким образом его гибкость.

- [Цепочка обязанностей (chain of responsibility)](#chain-of-responsibility)
- [Команда (command)](#command)                                
- [Итератор (iterator)](#iterator)
- [Посредник (mediator)](#mediator)                    
- [Хранитель (memento)](#memento)                  
- [Наблюдатель (observer)](#observer)                 
- [Состояние (state)](#state)
- [Стратегия (strategy)](#state)                   
- [Шаблонный метод (template method)](#template_method)      
- [Посетитель (visitor)](#visitor)    

---------
### structural patterns - структурные паттерны
---------

Определяют различные сложные структуры, которые изменяют интерфейс уже существующих объектов или его реализацию, позволяя облегчить разработку и оптимизировать программу.


- [Адаптер (adapter)](#adapter)                       
- [Мост (bridge)](#bridge)                           
- [Компоновщик (composite)](#composite)                 
- [Декоратор (decorator)](#decorator)                   
- [Фасад (facade)](facade)                          
- [Приспособленец (flyweight)](#flyweight)              
- [Прокси (proxy)](#proxy)   

### generating patterns - порождающие паттерны
---------
- [Абстрактная фабрика (abstract factory)](#abstract-factory)
- [Строитель (builder)](#builder)                     
- [Фабричный метод (factory method)](#factory-method)        
- [Прототип (prototype)](#prototype)
- [Одиночка (singleton)](#singleton)         

---------
<img src="https://github.com/vkrotin/PatternExamples/blob/master/Images/desk_image.png?raw=true">

<a name="abstract-factory"></a>
### Абстрактная фабрика (abstract factory)
Предоставляет интерфейс для создания семейств взаимосвязанных или взаимозависимых объектов, не специфицируя их конкретных классов. Шаблон реализуется созданием абстрактного класса Factory, который представляет собой интерфейс для создания компонентов системы (например, для оконного интерфейса он может создавать окна и кнопки). Затем пишутся классы, реализующие этот интерфейс.
* Система не должна зависеть от того, как создаются, компонуются и представляются входящие в неё объекты.
* Входящие в семейство взаимосвязанные объекты должны использоваться вместе и вам необходимо обеспечить выполнение этого ограничения.
* Система должна конфигурироваться одним из семейств составляющих её объектов.
* Требуется предоставить библиотеку объектов, раскрывая только их интерфейсы, но не реализацию.


<a name="builder"></a>
### Строитель (builder) 

Builder-это шаблон творческого проектирования, который позволяет создавать сложные объекты шаг за шагом. Шаблон позволяет создавать различные типы и представления объекта, используя один и тот же строительный код.

<a name="factory-method"></a>
### Factory Method
Также известен как Виртуальный конструктор — порождающий шаблон проектирования, предоставляющий подклассам интерфейс для создания экземпляров некоторого класса. В момент создания наследники могут определить, какой класс создавать. Иными словами, Фабрика делегирует создание объектов наследникам родительского класса. Это позволяет использовать в коде программы не специфические классы, а манипулировать абстрактными объектами на более высоком уровне.

_Плюсы_

* позволяет сделать код создания объектов более универсальным, не привязываясь к конкретным классам (ConcreteProduct), а оперируя лишь общим интерфейсом (Product)
* позволяет установить связь между параллельными иерархиями классов

_Минусы_

* необходимость создавать наследника Creator для каждого нового типа продукта (ConcreteProduct). Впрочем, современные языки программирования поддерживают конструкции, что позволяет реализовать фабричный метод без иерархии классов Creator


<a name="prototype"></a>
### Prototype (also known as copy) 
Прототип-это пораждающий шаблон, который позволяет копировать существующие объекты, не делая ваш код зависимым от их классов.

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
Однако это неправильно на нескольких уровнях. Во-первых, это не потокобезопасно, так что же произойдет, если несколько потоков попытаются получить к нему доступ одновременно? Нет никакой причины, по которой 1 поток не мог бы быть в середине выделения объекта, в то время как другой пытается получить доступ к объекту. Это на самом деле то, что Apple показывает в своей документации. Если вы должны использовать синглтоны, используйте dispatch_once() dispatch_once() решает проблему безопасной возможности создания синглтона в том,что (1) он гарантирует, что код в блоке будет вызываться только один раз в течение всего срока службы приложения (2) его потокобезопасность, как я уже отмечал в предыдущей статье, и (3) его быстрее, чем другие методы, такие как использование @synchronize () и т. д... "При одновременном вызове из нескольких потоков эта функция синхронно ожидает завершения блока." Так что вы должны писать это так...

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

__Критика:__

1. Он нарушает принцип единой ответственности из-за своего качества управления собственным созданием и жизненным циклом.
2. Он представляет глобальное состояние приложения. Я бы сказал, что глобальное состояние очень плохо, потому что любой код может изменить свое значение. Поэтому во время отладки очень трудно найти, какая часть кода сделала текущую стадию глобальной переменной.
3. Синглтон, как правило, плохая идея, если вы проводите модульное тестирование, и, как правило, плохая идея не выполнять модульное тестирование.

------------------------------------

<a name="adapter"></a>
### Adapter
Шаблон проектирования адаптера преобразует интерфейс класса в другой интерфейс, ожидаемый клиентами. Адаптер позволяет классам работать вместе, что иначе невозможно из-за несовместимых интерфейсов. Он отделяет клиента от класса целевого объекта.

<a name="bridge"></a>
### Bridge
Мост-это структурный шаблон проектирования, который делит бизнес-логику или огромный класс на отдельные иерархии классов, которые могут быть разработаны независимо.


<a name="decorator"></a>

### Decorator
Шаблон декоратора придает дополнительные обязанности объекту динамически. Декораторы предоставляют гибкую альтернативу подклассам для расширения функциональности. Как и подклассы, адаптация шаблона декоратора позволяет включать новое поведение без изменения существующего кода. Декораторы оборачивают объект класса, поведение которого они расширяют. Они реализуют тот же интерфейс, что и объект, который они оборачивают, и добавляют свое собственное поведение либо до, либо после делегирования задачи обернутому объекту. Шаблон декоратора выражает принцип проектирования, согласно которому классы должны быть открыты для расширения, но закрыты для модификации.

_General Comments_

including `NSAttributedString`, `NSScrollView`, `UIDatePicker`.

__Categories or extension__


<a name="proxy"></a>

### Proxy
Шаблон проектирования прокси предоставляет суррогат или заполнитель для другого объекта для управления доступом к этому другому объекту. Этот шаблон используется для создания репрезентативного или прокси-объекта, управляющего доступом к другому объекту, который может быть удаленным, дорогостоящим или нуждающимся в защите. Этот шаблон структурно похож на шаблон декоратора, но служит другой цели; декоратор добавляет поведение к объекту, в то время как прокси контролирует доступ к объекту.

---------

<a name="facade"></a>

### Facade
Шаблон проектирования фасад обеспечивает унифицированный интерфейс к набору интерфейсов в подсистеме. Шаблон определяет интерфейс более высокого уровня, который упрощает использование подсистемы, уменьшая сложность и скрывая связь и зависимости между подсистемами.


<a name="flyweight"></a>

### Flyweight
Flyweight-это структурный шаблон проектирования, который позволяет помещать больше объектов в доступный объем оперативной памяти, разделяя общие части состояния между несколькими объектами вместо того, чтобы хранить все данные в каждом объекте.

Шаблон Flyweight предполагает, что вы перестаете хранить внешнее состояние внутри объекта. Вместо этого вы должны передать это состояние определенным методам, которые полагаются на него. Только внутреннее состояние остается внутри объекта, позволяя вам повторно использовать его в различных контекстах. В результате вам понадобится меньше этих объектов, поскольку они отличаются только внутренним состоянием, которое имеет гораздо меньше вариаций, чем внешнее.


<a name="composite"></a>

### Composite

Шаблон проектирования компановщик объединяет связанные объекты в древовидные структуры для представления иерархий "часть-целое". Паттерн позволяет клиентам одинаково относиться к отдельным объектам и композициям объектов.
Шаблон Composite является частью MVC ( модель-представление-контроллер)

------------------------------------

<a name="chain-of-responsibility"></a>
### Chain of responsibility
Responder (ответчик) – объект, который может реагировать на события и обрабатывать их.
`responderObject : UIResponder; // or NSResponder in MacOS`

<img src="https://github.com/vkrotin/PatternExamples/blob/master/Images/chain_resp.png?raw=true">

Цепочка ответственности позволяет вам передавать объекте по цепочке объектов-обработчиков, пока не будет найден необходимый объект обработчик.
```
First responder -> next responder -> …
```
Первый ответчик – ответчик, получивший события первым (например view).

Когда использовать этот паттерн:

* У вас более чем один объект-обработчик.
* У вас есть несколько объектов обработчика, при этом вы не хотите специфицировать, который объект должен обрабатывать в даный момент времени.


<a name="command"></a>
### Command
Шаблон проектирования команда инкапсулирует запрос как объект, тем самым позволяя вам параметризовать клиентов с различными запросами, очередями или запросами журнала и поддерживать отменяемые операции. Объект запроса связывает одно или несколько действий с конкретным получателем. Шаблон команды отделяет объект, делающий запрос, от объектов, которые получают и выполняют этот запрос.


<a name="iterator"></a>
### Iterator

Шаблон проектирования итератор предоставляет способ последовательного доступа к элементам агрегатного объекта (то есть коллекции) без раскрытия его базового представления. Шаблон итератора передает ответственность за доступ и обход элементов коллекции от самой коллекции к объекту итератора. Итератор определяет интерфейс для доступа к элементам коллекции и отслеживает текущий элемент. Различные итераторы могут выполнять различные политики обхода.

__Enumerators (Счетчики)__

Класс ' NSEnumerator` в Foundation.framework реализует шаблон итератора. Частный, конкретный подкласс абстрактного класса 'NSEnumerator' возвращает объекты перечислителя, которые последовательно пересекают коллекции различных типов, массивы, наборы, словари (значения и ключи), возвращая объекты в коллекции клиентам.
'NSDirectoryEnumerator` - это отдаленно связанный класс. Экземпляры этого класса рекурсивно перечисляют содержимое каталога в файловой системе.

_Использование и ограничения_

Классы коллекций, такие как` NSArray`,` NSSet `и` NSDictionary', включают методы, возвращающие перечислитель, соответствующий типу коллекции.


<a name="mediator"></a>
### Mediator

Шаблон проектирования Mediator (посредник) определяет объект, который инкапсулирует, как взаимодействует набор объектов. Посредник способствует слабой связи, удерживая объекты от явной ссылки друг на друга, и позволяет варьировать их взаимодействие независимо. Таким образом, эти объекты могут оставаться более многоразовыми.
"Объект-посредник" в этом паттерне централизует сложную логику связи и управления между объектами в системе. Эти объекты сообщают объекту-посреднику об изменении своего состояния и, в свою очередь, отвечают на запросы объекта-посредника.


<a name="memento"></a>
### Memento

Шаблон Memento фиксирует и экстернализирует внутреннее состояние объекта, не нарушая инкапсуляции, так что объект может быть восстановлен в этом состоянии позже. Паттерн Memento сохраняет важное состояние ключевого объекта внешним по отношению к этому объекту для поддержания когезии.

__Хранение__

Архивирование преобразует объекты в программе вместе со свойствами этих объектов (атрибутами и отношениями) в архив, который может храниться в файловой системе или передаваться между процессами или по сети. Архив захватывает объектный граф программы как архитектурно-независимый поток байтов, который сохраняет идентичность объектов и отношений между ними. Поскольку тип объекта хранится вместе с его данными, объект, декодированный из потока байтов, обычно создается с использованием того же класса объекта, который был первоначально закодирован.

_Использование и ограничения_

Как правило, вы хотите архивировать те объекты в вашей программе, состояние которых вы хотите сохранить. Объекты модели почти всегда попадают в эту категорию. Вы записываете объект в архив, кодируя его, и читаете этот объект из архива, декодируя его. Кодирование и декодирование-это операции, выполняемые с использованием объекта "NSCoder", предпочтительно с использованием метода архивирования с ключом (требующего вызова методов классов "NSKeyedArchiver" и "NSKeyedUnarchiver"). Кодируемый и декодируемый объект должен соответствовать протоколу " NSCoding` ; методы этого протокола вызываются во время архивирования.



<a name="state"></a>
### State (some Strategy)

С помощью шаблона State машина состояний реализуется путем реализации каждого отдельного состояния как производного класса интерфейса шаблона состояний и реализации переходов состояний путем вызова методов, определенных суперклассом шаблона. Паттерн State может быть интерпретирован как паттерн Strategy (стратегия), который способен переключать текущую стратегию с помощью вызовов методов, определенных в интерфейсе паттерна. Этот шаблон используется в компьютерном программировании для инкапсуляции изменяющегося поведения одного и того же объекта на основе его внутреннего состояния. Это может быть более чистым способом для объекта изменить свое поведение во время выполнения, не прибегая к большим монолитным условным операторам, и таким образом улучшить ремонтопригодность.



<a name="observer"></a>
### Observer

Шаблон проектирования Observer дает возможность реагировать на события происходящие в других объектах , не связываясь с их классами. Шаблон может быть распознан методами подписки, хранящими объекты в списке, и вызовами метода обновления, выданного объектам в этом списке. Примеры: KVO , Delegate. 


<a name="template_method"></a>
### Template method

Шаблонный метод - это поведенческий шаблон проектирования, который позволяет определить скелет алгоритма в базовом классе и позволить подклассам переопределять шаги без изменения общей структуры алгоритма. 

Примеры:
 * Abstract protocol
 * Сlass inheritance (override methods)
 
 
 <a name="visitor"></a>
 ### Visitor
 
 Посетитель-это поведенческий шаблон проектирования, который позволяет добавлять новые модели поведения в существующую иерархию классов без изменения существующего кода.
 Примеры: методы наследования класса с различными параметрами интерпретации в методах
