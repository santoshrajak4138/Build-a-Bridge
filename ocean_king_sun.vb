Public Class Bridge
   ' Declare properties for Bridge 
   Private _name As String
   Public Property Name As String
      Get
         Return _name
      End Get
      Set(ByVal value As String)
         _name = value
      End Set
   End Property

   Private _beginningLocation As String
   Public Property BeginningLocation As String
      Get
         Return _beginningLocation
      End Get
      Set(ByVal value As String)
         _beginningLocation = value
      End Set
   End Property

   Private _endingLocation As String
   Public Property EndingLocation As String
      Get
         Return _endingLocation
      End Get
      Set(ByVal value As String)
         _endingLocation = value
      End Set
   End Property

   Private _length As Integer
   Public Property Length As Integer
      Get
         Return _length
      End Get
      Set(ByVal value As Integer)
         _length = value
      End Set
   End Property

   Private _span As Integer
   Public Property Span As Integer
      Get
         Return _span
      End Get
      Set(ByVal value As Integer)
         _span = value
      End Set
   End Property

   Private _height As Integer
   Public Property Height As Integer
      Get
         Return _height
      End Get
      Set(ByVal value As Integer)
         _height = value
      End Set
   End Property

   Private _weightCapacity As Integer
   Public Property WeightCapacity As Integer
      Get
         Return _weightCapacity
      End Get
      Set(ByVal value As Integer)
         _weightCapacity = value
      End Set
   End Property

   Private _numberOfPylons As Integer
   Public Property NumberOfPylons As Integer
      Get
         Return _numberOfPylons
      End Get
      Set(ByVal value As Integer)
         _numberOfPylons = value
      End Set
   End Property

   Private _materialsUsed As String
   Public Property MaterialsUsed As String
      Get
         Return _materialsUsed
      End Get
      Set(ByVal value As String)
         _materialsUsed = value
      End Set
   End Property

   Private _cost As Decimal
   Public Property Cost As Decimal
      Get
         Return _cost
      End Get
      Set(ByVal value As Decimal)
         _cost = value
      End Set
   End Property

   Private _constructionStartDate As DateTime
   Public Property ConstructionStartDate As DateTime
      Get
         Return _constructionStartDate
      End Get
      Set(ByVal value As DateTime)
         _constructionStartDate = value
      End Set
   End Property

   Private _constructionEndDate As DateTime
   Public Property ConstructionEndDate As DateTime
      Get
         Return _constructionEndDate
      End Get
      Set(ByVal value As DateTime)
         _constructionEndDate = value
      End Set
   End Property

   Private _maintenanceFrequency As Integer
   Public Property MaintenanceFrequency As Integer
      Get
         Return _maintenanceFrequency
      End Get
      Set(ByVal value As Integer)
         _maintenanceFrequency = value
      End Set
   End Property

   ' Declare Variables and Constants
   Const PI = 3.14
   Private TotalPieces As Integer
   Private PiecesPerDay As Integer
   Private WorkDays As Integer
   Private StartTime As Date
   Private EndTime As Date
   Private PieceCost As Decimal
   Private TotalCost As Decimal

   'Declare Functions 
   Public Sub CalculatePiecesRequired()
      TotalPieces = Span * Height * Length
   End Sub

   Public Sub CalculatePiecesPerDay()
      WorkDays = DateDiff("d", ConstructionStartDate, ConstructionEndDate)
      PiecesPerDay = TotalPieces / WorkDays
   End Sub

   Public Sub CalculatePieceCost()
      PieceCost = Cost / TotalPieces
   End Sub

   Public Sub CalculateTotalCost()
      TotalCost = PieceCost * TotalPieces
   End Sub

   Public Sub CalculateStartAndEndTime()
      StartTime = DateAdd("h", 8, ConstructionStartDate)
      EndTime = DateAdd("h", 16, ConstructionStartDate, WorkDays - 1)
   End Sub
   
   'Constructor
   Public Sub New() 
      _name = ""
      _beginningLocation = ""
      _endingLocation = ""
      _length = 0
      _span = 0
      _height = 0
      _weightCapacity = 0
      _numberOfPylons = 0
      _materialsUsed = ""
      _cost = 0
      _constructionStartDate = DateTime.Now
      _constructionEndDate = DateTime.Now
      _maintenanceFrequency = 0
   End Sub

End Class