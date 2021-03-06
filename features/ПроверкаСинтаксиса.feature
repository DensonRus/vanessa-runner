# language: ru

Функционал: Проверка синтаксиса
	Как Разработчик/Инженер по тестированию
	Я Хочу иметь возможность автоматической проверки синтаксиса конфигурации
    Чтобы удостовериться в качестве подготовленной конфигурации

Контекст:
    Допустим я подготовил репозиторий и рабочий каталог проекта
    И я подготовил рабочую базу проекта "./build/ib" по умолчанию
    
Сценарий: Синтаксическая проверка временной файловой базы
    # Допустим  я включаю отладку лога с именем "oscript.app.vanessa-runner"
    Допустим Я очищаю параметры команды "oscript" в контексте 
    
    Когда Я добавляю параметр "<КаталогПроекта>/src/main.os syntax-check" для команды "oscript"
    И Я добавляю параметр "--ibconnection /Fbuild/ib" для команды "oscript"
    И Я добавляю параметр "--mode -ThinClient -WebClient -Server -ExternalConnection -ThickClientOrdinaryApplication" для команды "oscript"
    Когда Я выполняю команду "oscript"
    # И Я сообщаю вывод команды "oscript"
    Тогда Вывод команды "oscript" содержит
    # | /CheckConfig -ThinClient -WebClient -Server -ExternalConnection -ThickClientOrdinaryApplication |
    | Результат синтакс-контроля: Ошибок не обнаружено |

    И Код возврата команды "oscript" равен 0
    # Тогда в лог-файле запуска продукта есть строка 'testsuite name="Синтаксическая проверка конфигурации"'
    
Сценарий: Синтаксическая проверка временной файловой базы c результатами в формате JUnit
    # Допустим  я включаю отладку лога с именем "oscript.app.vanessa-runner"
    Допустим Я очищаю параметры команды "oscript" в контексте 
    
    Когда Я добавляю параметр "<КаталогПроекта>/src/main.os syntax-check" для команды "oscript"
    И Я добавляю параметр "--junitpath junit.xml" для команды "oscript"
    И Я добавляю параметр "--ibconnection /Fbuild/ib" для команды "oscript"
    И Я добавляю параметр "--mode -ThinClient -WebClient -Server -ExternalConnection -ThickClientOrdinaryApplication" для команды "oscript"
    Когда Я выполняю команду "oscript"
    # И Я сообщаю вывод команды "oscript"
    И Файл "junit.xml" содержит
    """
    <testsuite name="CheckConfig.junit">
    """
    И Файл "junit.xml" содержит 'status="passed"'
    И Код возврата команды "oscript" равен 0
    # Тогда в лог-файле запуска продукта есть строка 'testsuite name="Синтаксическая проверка конфигурации"'

Сценарий: Синтаксическая проверка временной файловой базы c результатами в формате JUnit с группировкой
    # Допустим  я включаю отладку лога с именем "oscript.app.vanessa-runner"
    Допустим Я очищаю параметры команды "oscript" в контексте 
    
    Когда Я добавляю параметр "<КаталогПроекта>/src/main.os syntax-check" для команды "oscript"
    И Я добавляю параметр "--junitpath junit.xml" для команды "oscript"
    И Я добавляю параметр "--groupbymetadata" для команды "oscript"
    И Я добавляю параметр "--ibconnection /Fbuild/ib" для команды "oscript"
    И Я добавляю параметр "--mode -ThinClient -WebClient -Server -ExternalConnection -ThickClientOrdinaryApplication" для команды "oscript"
    Когда Я выполняю команду "oscript"
    # И Я сообщаю вывод команды "oscript"
    И Файл "junit.xml" содержит
    """
    <testsuite name="CheckConfig.junit">
    """
    И Файл "junit.xml" содержит 'status="passed"'
    И Код возврата команды "oscript" равен 0
    # Тогда в лог-файле запуска продукта есть строка 'testsuite name="Синтаксическая проверка конфигурации"'

Сценарий: Синтаксическая проверка базы с ошибками c результатами в формате JUnit с группировкой
    # Допустим  я включаю отладку лога с именем "oscript.app.vanessa-runner"
    Допустим Я очищаю параметры команды "oscript" в контексте 
    
    И Я копирую каталог "cfbad" из каталога "tests/fixtures" проекта в рабочий каталог
    И Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/src/main.os init-dev --src ./cfbad --nocacheuse --ibconnection /F./build/ib"
    
    Когда Я очищаю параметры команды "oscript" в контексте
    Когда Я добавляю параметр "<КаталогПроекта>/src/main.os syntax-check" для команды "oscript"
    И Я добавляю параметр "--junitpath junit.xml" для команды "oscript"
    И Я добавляю параметр "--groupbymetadata" для команды "oscript"
    И Я добавляю параметр "--ibconnection /Fbuild/ib" для команды "oscript"
    И Я добавляю параметр "--mode -ThinClient -WebClient -Server -ExternalConnection -ThickClientOrdinaryApplication" для команды "oscript"
    Когда Я выполняю команду "oscript"
    И файл "junit.xml" существует
    И Файл "junit.xml" содержит
    """
    <testsuite name="CheckConfig.junit">
    """
    И Файл "junit.xml" содержит 'status="failure"'

Сценарий: Синтаксическая проверка базы с ошибками c результатами в формате JUnit БЕЗ группировки
    # Допустим  я включаю отладку лога с именем "oscript.app.vanessa-runner"
    Допустим Я очищаю параметры команды "oscript" в контексте 
    
    И Я копирую каталог "cfbad" из каталога "tests/fixtures" проекта в рабочий каталог
    И Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/src/main.os init-dev --src ./cfbad --nocacheuse --ibconnection /F./build/ib"
    
    Когда Я очищаю параметры команды "oscript" в контексте
    Когда Я добавляю параметр "<КаталогПроекта>/src/main.os syntax-check" для команды "oscript"
    И Я добавляю параметр "--junitpath junit.xml" для команды "oscript"
    И Я добавляю параметр "--ibconnection /Fbuild/ib" для команды "oscript"
    И Я добавляю параметр "--mode -ThinClient -WebClient -Server -ExternalConnection -ThickClientOrdinaryApplication" для команды "oscript"
    Когда Я выполняю команду "oscript"
    И файл "junit.xml" существует
    И Файл "junit.xml" содержит
    """
    <testsuite name="CheckConfig.junit">
    """
    И Файл "junit.xml" содержит 'status="failure"'

Сценарий: Синтаксическая проверка базы с ошибками пустых обработчиков с группировкой
    # Допустим  я включаю отладку лога с именем "oscript.app.vanessa-runner"
    Допустим Я очищаю параметры команды "oscript" в контексте 
    
    Когда Я очищаю параметры команды "oscript" в контексте
    И Я добавляю параметр "<КаталогПроекта>/src/main.os syntax-check" для команды "oscript"
    И Я добавляю параметр "--junitpath junit.xml" для команды "oscript"
    И Я добавляю параметр "--groupbymetadata" для команды "oscript"
    И Я добавляю параметр "--ibconnection /Fbuild/ib" для команды "oscript"
    И Я добавляю параметр "--mode -ThinClient -WebClient -Server -ExternalConnection -ThickClientOrdinaryApplication -EmptyHandlers" для команды "oscript"
    Когда Я выполняю команду "oscript"
    И файл "junit.xml" существует
    И Файл "junit.xml" содержит
    """
    <testsuite name="CheckConfig.junit">
    """
    И Файл "junit.xml" содержит 'status="passed"'
