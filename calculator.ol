// File: calculator.ol

interface CalculatorInterface {
    RequestResponse: add(int x, int y)(int result)
}

service Calculator {
    inputPort CalculatorInput {
        location: "socket://localhost:1234"
        protocol: soap
        interfaces: CalculatorInterface
    }

    outputPort LoggerOutput {
        location: "socket://localhost:4321"
        protocol: soap
    }

    main {
        x = 0;
        y = 0;

        // Receive the request
        receive add(x, y) from CalculatorInput;

        // Perform addition
        result = x + y;

        // Send the response back
        send result to CalculatorInput;
    }
}
