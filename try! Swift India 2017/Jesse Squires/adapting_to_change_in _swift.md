theme: Work, 3
autoscale: true
build-lists: false
slidenumbers: false

# [fit] **Adapting to change**:
# [fit] designing for modularity
# [fit] and maintainability in Swift

**Jesse Squires**
*jessesquires.com* • *@jesse_squires*

---

# **I work at**

![50% original](img/plangrid.png)

^Construction productivity software
Like git, github, IDE for construction

---

# [fit] **Construction**
# [fit] and **software**
# [fit] have a lot in **common**

---

# [fit] Connecting
# [fit] **model**
# [fit] and **UI**
# [fit] layers

![fit right](https://www.biggerpockets.com/renewsblog/wp-content/uploads/2014/03/spiral-stairs.jpg)

^Many different components that need to work together

---

# [fit] When you forget
# [fit] to implement
# [fit] **accessibility**
# [fit] features

![left](http://www.funcage.com/blog/wp-content/uploads/2016/06/Construction-Fails-02-550x549.jpg)

^We need to consider our users' accessibility

---

# Client-server **communication**

![](http://3.bp.blogspot.com/_MQquAuiuf4k/S_AlQElJ6FI/AAAAAAAAAkU/drRnMJR782s/s1600/oops-.jpg)

^We work across multiple teams to complete a feature/product

---

# When you can only do **half** of the **refactoring**

![right](https://thechive.files.wordpress.com/2014/09/construction-fails-17-e1412005654401.jpg)

^We create bugs and need to refactor
Yes, **buildings have bugs**.

---

# When your new feature has user **privacy** or **usability** issues

![left](http://cdn.ebaumsworld.com/mediaFiles/picture/566750/84372366.jpg)

^We have to address privacy and design issues
Sometimes a design seems great in concept, but not so great in practice

---

# [fit] ✍️ DESIGNING
# [fit] **BUILDING** 🛠
# [fit] 📲 PROTOTYPING
# [fit] **VERIFYING** 🔬

---

# So, you're writing some code

![](https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif)

---

# And everything is going **great**

![](https://media.giphy.com/media/smuGCry4aY9DG/giphy.gif)

---

# [fit] Then your product manager is like,
# **"Hey, you got a sec? Can we talk about..."**

![](https://media.giphy.com/media/1fMjj5j2Z7chq/giphy.gif)

---

# **You accept the meeting invite.**
# You know what's coming...

![](https://media.giphy.com/media/pqjFtapkOSqPe/giphy.gif)

---

# [fit] **"The requirements have changed"**
# they say
# **"Now it needs to also do..."**

![](https://media.giphy.com/media/PKgkx1bIE03Ic/giphy.gif)

---

# But, you've **coded** yourself into a **corner**

![](https://media.giphy.com/media/MfXhWHkHeOyVW/giphy.gif)

---

# [fit] **And you** can't **get out**

![](https://media.giphy.com/media/DNwel6HfOkiys/giphy.gif)

---

# [fit] How can we
# [fit] **prevent** this?

![](http://78.media.tumblr.com/2c769ab9f418ee70b347acba9564285b/tumblr_oi5r3lUvmj1ugyavxo1_540.jpg)

---

# [fit] **No** code is **best** code

![](https://media.giphy.com/media/HteV6g0QTNxp6/giphy-downsized-large.gif)

---

# [fit] Solution: **better**[^*] code

![fit](https://media.giphy.com/media/l0zAiJHyg0fMA/giphy.gif)

[^*]: *Slightly less terrible*

---

![fit](http://ruby.zigzo.com/wp-content/uploads/sites/2/2013/02/wat-gigantic-duck.jpg)

^"better code"
what does that even mean?

---

![100% original](img/slava_tweet.png)

^https://mobile.twitter.com/slava_pestov/status/921810703823941632

---

# [fit] **S O L I D**
# [fit] design principles

(Good ideas here for object-oriented _**and**_ functional programming!)

---

# **S**ingle responsibility
# **O**pen/closed
# **L**iskov substitution
# **I**nterface segregation
# **D**ependency inversion

---

# [fit] Any `type` you
# [fit] create should
# [fit] only have **one**
# [fit] **reason** to change

---

# [fit] **S**ingle responsibility ❌

```swift
class ImageDownloader {

    let cache: [URL: UIImage]
    let fileManager: FileManager
    let session: URLSession

    func getOrDownloadImage(url: URL,
                            completion: @escaping (UIImage?) -> Void)
}
```

^"One reason to change"

---

# [fit] **S**ingle responsibility ✅

```swift
class Downloader<T> {
    func downloadItem(url: URL, completion: @escaping (Result<T>) -> Void)
}

class Cache<T> {
    func store(item: T, key: String, completion: @escaping (Bool) -> Void)

    func retrieveItem(key: String, completion: @escaping (Result<T>) -> Void)
}

class DataProvider<T> {
    let downloader: Downloader<T>
    let cache: Cache<T>

    func getItem(url: URL, completion: @escaping (Result<T>) -> Void)
}
```

---

# [fit] **Open** for extension
# [fit] **closed** for modification

How can we change behavior without modifying a type?

- Subclass 😭
- Inject dependency
    - Inject protocol
    - Pass a function

---

# [fit] **O**pen / closed

Examples

```swift
UITableViewDelegate

func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element]
```

---

# [fit] **L**iskov substitution

Types should be **replaceable** with instances of their **subtypes** without altering **correctness**

```swift
protocol ParentProtocol { }

protocol ChildProtocol: ParentProtocol { }

func foo(bar: ParentProtocol) { }
```

---

# [fit] **I**nterface segregation

Use many specific interfaces, rather than one general purpose

```swift
protocol UITableViewDataSource {
    func tableView(_, cellForRowAt: ) -> UITableViewCell
    func numberOfSections(in: ) -> Int
    func tableView(_, numberOfRowsInSection: ) -> Int
}

protocol UITableViewDataSourceEditing {
    func tableView(_, commit: , forRowAt: )
    func tableView(_, canEditRowAt: ) -> Bool
}
```

---

# [fit] **D**ependency inversion

Decouple via protocols and injection

```swift
class MyViewController: UIViewController {

    let userManager: CurrentUserManager
    let defaults: UserDefaults
    let urlSession: URLSession

    init(userManager: CurrentUserManager = .shared,
         defaults: UserDefaults = .standard,
         urlSession: URLSession = .shared)
}
```

---

# [fit] **Intertwined** components
# [fit] create **cognitive**
# [fit] and **maintenance**
# [fit] burdens

---

# [fit] **Let's talk about**
# [fit] CLARITY

---

# [fit] Example: **drawing line graphs** 📈

```swift
let p1 = Point(x1, y1)
let p2 = Point(x2, y2)
let slope = p1.slopeTo(p2)

```

*Need to check if the slope is:*

- undefined (vertical line)
- zero (horizontal line)
- positive
- negative

---

We could write this

```swift
if slope == 0 {
    // horizontal line

} else if slope.isNaN {
    // vertical line, undefined

} else if slope > 0 {
    // positive slope

} else if slope < 0 {
    // negative slope
}
```

---

Or, we could add extensions and **remove** the comments.

```swift
if slope.isHorizontal {

} else if slope.isUndefined {

} else if slope.isPositive {

} else if slope.isNegative {

}
```

*This code reads like a sentence.*

---

# [fit] Another example: custom layout

```swift
func oldBehaviors(for
    attributes: [UICollectionViewLayoutAttributes]) -> [UIAttachmentBehavior] {
    return animator.behaviors.flatMap {
        $0 as? UIAttachmentBehavior
        }.filter {
            guard let item = $0.items.first
                as? UICollectionViewLayoutAttributes else {
                    return false
            }
            return !attributes.map {
                $0.indexPath
                }.contains(item.indexPath)
    }
}
```

---

```swift
func oldBehaviors(for
    attributes: [UICollectionViewLayoutAttributes]) -> [UIAttachmentBehavior] {

    let attributesIndexPaths = attributes.map { $0.indexPath }

    let attachmentBehaviors = animator.behaviors.flatMap {
        $0 as? UIAttachmentBehavior
    }

    let filteredBehaviors = attachmentBehaviors.filter {
        guard let attributes = $0.attributes else {
            return false
        }
        return !attributesIndexPaths.contains(attributes.indexPath)
    }

    return filteredBehaviors
}
```

---

# Keep it small and simple
# **Write code, not comments**
# Separate components
# **Inject dependencies**
# Avoid over-abstraction
# **Avoid unnecessary complexity**

^software is necessarily complex. complexity is ok. avoid being complicated.

---

# [fit] *Thanks!*

*Jesse Squires*
**jessesquires.com** • **@jesse_squires**
<br>
*Swift Weekly Brief:*
**swiftweekly.github.io** • **@swiftlybrief**
