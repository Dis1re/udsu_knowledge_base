#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>

// Функция для вычисления среднего арифметического
double calculateMean(const std::vector<int>& numbers) {
    int sum = 0;
    for (int num : numbers) {
        sum += num;
    }
    return static_cast<double>(sum) / numbers.size();
}

// Функция для разделения нечетных чисел на среднее арифметическое
void divideOddNumbersByMean(const std::string& inputFile, const std::string& outputFile) {
    std::ifstream input(inputFile);
    std::ofstream output(outputFile);

    if (!input.is_open()) {
        std::cout << "Ошибка открытия файла " << inputFile << std::endl;
        return;
    }

    if (!output.is_open()) {
        std::cout << "Ошибка открытия файла " << outputFile << std::endl;
        return;
    }

    std::vector<int> numbers;
    int number;
    while (input >> number) {
        numbers.push_back(number);
    }

    double mean = calculateMean(numbers);

    for (int num : numbers) {
        if (std::abs(num) % 2 == 1) {
            output << static_cast<double>(num) / mean << std::endl;
        }
        else {
            output << num << std::endl;
        }
    }

    input.close();
    output.close();
}

int main() {
    std::string inputFile = "input.txt";
    std::string outputFile = "output.txt";

    // Формирование текстового файла с 20 случайными числами
    std::ofstream input(inputFile);
    if (input.is_open()) {
        srand(time(0));
        for (int i = 0; i < 20; i++) {
            int number = rand() % 21 - 10; // Генерация числа от -10 до +10
            input << number << std::endl;
        }
        input.close();
    }
    else {
        std::cout << "Ошибка открытия файла " << inputFile << std::endl;
        return 0;
    }

    // Формирование выходного файла
    divideOddNumbersByMean(inputFile, outputFile);

    std::cout << "Выходной файл успешно создан." << std::endl;

    return 0;
}