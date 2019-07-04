package com.prakash.practice;

public class LambdaExample {

	public static void main(String[] args) {
		
		MathOperation subtractionFunction=(a,b) -> a - b;
		MathOperation additionFunction=(a,b) -> a + b;
		MathOperation multiplyFunction=(a,b) -> a * 2;
		
		int i = 10;
		int j = 5;
		System.out.println("Subtraction: "+subtractionFunction.execute(i, j));
		System.out.println("Addition: "+additionFunction.execute(i, j));
		System.out.println("Multiply: "+multiplyFunction.execute(i, j));

	}
	
	@FunctionalInterface
	interface MathOperation{
		int execute(int a, int b);
		
		//This won't be allowed if we mark an interface as Functional Interface
		//void add(int a, int b);
	}
}

