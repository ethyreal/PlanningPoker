# PlanningPoker
Simple example of an MVVM+C implementation.


## Project Goals

1. Create a non trivial app using MVC as given by apple.  Build up "massive view controllers" or at least tightly coupled.  They shoudl have the following inside each UIViewController:
    - Model/Business
    - Navigation/Routing
    - Networking
2. Refactor logic item by time towards a goal of MVVM+C.  Each iteration should have:
    - An issue associated with it
    - Issues can serve as a kind of dev diary
3. Polish well factored POC into a fully functioning MVP of Planning Poker
4. Explore evolving this archetecute towards a desclarive and reactive paradigm using Combine and SwiftUI
5. Make the case for MVVM as a prefered transitional design pattern that is useful for a UIKit world and later for a SwiftUI world