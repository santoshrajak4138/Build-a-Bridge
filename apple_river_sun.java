import java.awt.*;
import java.util.*;

public class BuildBridge {
	
	public static void main(String[] args) {
		
		//Declare and Initialize variables
		int length = 0;
		int width = 0;
		int supports = 0;
		int designMaterials = 0;
		
		//User prompt
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("What is the desired length of the bridge (in feet)? ");
		length = scanner.nextInt();
		
		System.out.println("What is the desired width of the bridge (in feet)? ");
		width = scanner.nextInt();
		
		System.out.println("How many supports will the bridge need? ");
		supports = scanner.nextInt();
		
		System.out.println("What design materials will be used to build the bridge? ");
		designMaterials = scanner.nextInt();
		
		//Calculate the area of the bridge
		int area = length * width;
		
		//Calculate the cost of the bridge based on area and design materials
		double cost = (area * designMaterials) + (supports * 25);
		
		//Print the cost of the bridge
		System.out.println("This bridge will cost $" + cost);
		
		//Get the materials needed for the bridge
		String materials = getMaterials(designMaterials);
		
		//Construct the bridge
		constructBridge(length, width, supports, materials);
		
		scanner.close();
	}
	
	/*
     * Method Name: getMaterials
     * Purpose: This method returns the materials needed for the bridge
     * Accepts: Integer
     * Returns: String
     */
	public static String getMaterials(int designMaterials) {
		
		if(designMaterials == 1) {
			return "Steel";
		}
		if(designMaterials == 2) {
			return "Concrete";
		}
		if(designMaterials == 3) {
			return "Wood";
		}
		if(designMaterials == 4) {
			return "Stone";
		}
		else {
			return "Invalid Design Material";
		}
	}
	
	/*
     * Method Name: constructBridge
     * Purpose: This method constructs the bridge
     * Accepts: Integers and String
     * Returns: void
     */
	public static void constructBridge(int length, int width, int supports, String materials ) {
		
		System.out.println("Constructing a bridge...");
		System.out.println("Length: " + length + " Width: " + width);
		System.out.println("Number of supports: " + supports);
		System.out.println("Design Material: " + materials);
		
		//Construct the bridge
		for(int i = 1; i <= supports; i++) {
			System.out.println("Constructing support #" + i);
		}
		
		System.out.println("Creating the bridge deck with " + materials);
		for(int i = 1; i <= length; i++) {
			System.out.println("Creating section #" + i);
		}
		
		System.out.println("Bridge construction complete!");
	}
}