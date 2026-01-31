#include <iostream>
#include <string>

int main() {
    std::string message = "Hello, World!";
    std::cout << message << std::endl;
    std::cout << "Compiled on: " << __DATE__ << " " << __TIME__ << std::endl;
    std::cout << "Platform: Linux (Ubuntu)" << std::endl;
    return 0;
}
