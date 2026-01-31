set -e
echo "========================================================"
echo "  СБОРКА ПРОЕКТА HELLO WORLD — UBUNTU"
echo "========================================================"
echo

# Проверка наличия утилит
if ! command -v gcc &> /dev/null; then
    echo "[ОШИБКА] Не найден компилятор gcc. Установите пакет build-essential."
    exit 1
fi

if ! command -v cmake &> /dev/null; then
    echo "[ОШИБКА] Не найден CMake. Установите пакет cmake."
    exit 1
fi

# Обновление из Git (если есть удалённый репозиторий)
if command -v git &> /dev/null && [ -d ".git" ]; then
    echo "[Git] Обновление кода из репозитория..."
    git pull origin main 2>/dev/null || git pull origin master 2>/dev/null || echo "[Git] Нет удалённого репозитория — пропускаем pull"
    echo
fi
# Создание папки сборки
mkdir -p build
cd build

# Генерация проекта CMake
echo "[CMake] Генерация проекта..."
cmake .. -DCMAKE_BUILD_TYPE=Debug
if [ $? -ne 0 ]; then
    echo "[ОШИБКА] Ошибка генерации CMake"
    exit 1
fi

echo

# Сборка проекта
echo "[CMake] Сборка проекта..."
cmake --build . --config Debug
if [ $? -ne 0 ]; then
    echo "[ОШИБКА] Ошибка сборки"
    exit 1
fi
echo

# Запуск программы
echo "[Запуск] Выполнение программы:"
./hello-world

echo
echo "========================================================"
echo "  СБОРКА ЗАВЕРШЕНА УСПЕШНО"
echo "========================================================"
