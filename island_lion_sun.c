#include <stdio.h> 
#include <stdlib.h> 

// Define constants 
#define MAX_LENGTH 50 
#define BRIDGE_WIDTH 10 
#define BRIDGE_HEIGHT 100 
#define GAP_LENGTH 5 

// Structure for bridge pillars 
struct Pillar 
{ 
    int x; 
    int y; 
    int length; 
    int width; 
}; 

// Function to create bridge pillars 
void createPillar(struct Pillar *pillar, int x, int y, int length, int width); 

// Function to build the bridge 
void buildBridge(struct Pillar * pillars, int num_of_pillars); 

int main() 
{ 
    struct Pillar pillars[MAX_LENGTH]; 
  
    // Input number of pillars 
    int num_of_pillars; 
    printf("Enter number of pillars: "); 
    scanf("%d", &num_of_pillars); 
  
    // Create the pillars 
    for (int i = 0; i < num_of_pillars; i++) 
    { 
        int x, y, length, width; 
        printf("Enter pillar %d: ", i); 
        scanf("%d %d %d %d", &x, &y, &length, &width); 
        createPillar(&(pillars[i]), x, y, length, width); 
    } 
  
    // Build the bridge 
    buildBridge(pillars, num_of_pillars); 
  
    return 0; 
} 

// Function to create bridge pillars 
void createPillar(struct Pillar *pillar, int x, int y, int length, int width) 
{ 
    pillar->x = x; 
    pillar->y = y; 
    pillar->length = length; 
    pillar->width = width; 
} 

// Function to build a bridge 
void buildBridge(struct Pillar * pillars, int num_of_pillars) 
{ 
    // Initialize the bridge variables 
    int bridge_length = 0; 
    int bridge_x = pillars[0].x; 
    int bridge_y = pillars[0].y; 
    int p1_x = pillars[0].x; 
    int p1_y = pillars[0].y; 
    int p2_x = pillars[0].x; 
    int p2_y = pillars[0].y; 
  
    // Iterate through the pillars to build the bridge 
    for (int i = 1; i < num_of_pillars; i++) 
    { 
        // Check if the pillars are in line 
        if ((p1_x == p2_x && pillars[i].x == p2_x) 
            || (p1_y == p2_y && pillars[i].y == p2_y)) 
        { 
            // Calculate bridge length 
            if (p1_x == p2_x) 
                bridge_length += pillars[i].y - p2_y; 
            else
                bridge_length += pillars[i].x - p2_x; 
  
            // Update x and y positions 
            bridge_x = pillars[i].x; 
            bridge_y = pillars[i].y; 
  
            // Update pillar positions 
            p2_x = pillars[i].x; 
            p2_y = pillars[i].y; 
        } 
        else
        { 
            // Calculate the gap length 
            int gap_length = pillars[i].x - p2_x; 
            if (gap_length < 0) 
                gap_length = pillars[i].y - p2_y; 
  
            // Check if the gap length is valid 
            if (gap_length > GAP_LENGTH) 
            { 
                // Calculate bridge length 
                if (p1_x == p2_x) 
                    bridge_length += pillars[i].y - p2_y; 
                else
                    bridge_length += pillars[i].x - p2_x; 
  
                // Update x and y positions 
                bridge_x = pillars[i].x; 
                bridge_y = pillars[i].y; 
  
                // Update pillar positions 
                p1_x = pillars[i].x; 
                p1_y = pillars[i].y; 
                p2_x = pillars[i].x; 
                p2_y = pillars[i].y; 
            } 
            else
            { 
                // Calculate bridge length 
                if (p1_x == p2_x) 
                    bridge_length += p2_y - p1_y; 
                else
                    bridge_length += p2_x - p1_x; 
            } 
        } 
    } 
  
    // Print bridge details 
    printf("Length: %d\n", bridge_length); 
    printf("X Position: %d\n", bridge_x); 
    printf("Y Position: %d\n", bridge_y); 
    printf("Width: %d\n", BRIDGE_WIDTH); 
    printf("Height: %d\n", BRIDGE_HEIGHT); 
}