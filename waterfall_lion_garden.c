#include <stdio.h>
#include <stdlib.h>
 
// Structure of a point
struct point
{
    int x, y;
};
 
// A structure to represent a queue
struct queue
{
    int front, rear, size;
    unsigned capacity;
    struct point* array;
};
 
// function to create a queue of given capacity. 
// It initializes size of queue as 0
struct queue* createQueue(unsigned capacity)
{
    struct queue* queue = (struct queue*) malloc(sizeof(struct queue));
    queue->capacity = capacity;
    queue->front = queue->size = 0; 
    queue->rear = capacity - 1;  // This is important, see the enqueue
    queue->array = (struct point*) malloc(queue->capacity * sizeof(struct point));
    return queue;
}
 
// Queue is full when size becomes equal to the capacity 
int isFull(struct queue* queue)
{  return (queue->size == queue->capacity);  }
 
// Queue is empty when size is 0
int isEmpty(struct queue* queue)
{  return (queue->size == 0); }
 
// Function to add an item to the queue.  
// It changes rear and size
void enqueue(struct queue* queue, struct point item)
{
    if (isFull(queue))
        return;
    queue->rear = (queue->rear + 1)%queue->capacity;
    queue->array[queue->rear] = item;
    queue->size = queue->size + 1;
    printf("%d enqueued to queue\n", item);
}
 
// Function to remove an item from queue. 
// It changes front and size
struct point dequeue(struct queue* queue)
{
    if (isEmpty(queue))
        return;
    struct point item = queue->array[queue->front];
    queue->front = (queue->front + 1)%queue->capacity;
    queue->size = queue->size - 1;
    return item;
}
 
// Function to get front of queue
struct point front(struct queue* queue)
{
    if (isEmpty(queue))
        return;
    return queue->array[queue->front];
}
 
// Function to get rear of queue
struct point rear(struct queue* queue)
{
    if (isEmpty(queue))
        return;
    return queue->array[queue->rear];
}
 
// function to calculate length of bridge
int bridgeLength(struct point p1, struct point p2) {
	int x = (p1.x - p2.x) * (p1.x - p2.x);
	int y = (p1.y - p2.y) * (p1.y - p2.y);
	return (int) sqrt(x + y);
}
 
int main()
{
    // input number of points
    int n;
    scanf("%d",&n);
 
    // Create a queue of capacity n
    struct queue* q = createQueue(n);
 
    // input points
    for (int i = 0; i < n; i++) {
        struct point p;
        scanf("%d %d", &p.x, &p.y);
 		enqueue(q, p);
    }
 
    // build the bridge
    int bridgeLength = 0;
    while (1) {
        struct point from = dequeue(q);
        struct point to = front(q);
		bridgeLength += bridgeLength(from, to);
		if (isEmpty(q))
			break;
	}
	
	printf("Bridge Length: %d\n", bridgeLength);
    return 0;
}