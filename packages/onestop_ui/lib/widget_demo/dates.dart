import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import 'package:intl/intl.dart';
import '../constants/spacing.dart';

class OCalendar extends StatefulWidget {
 final Function(DateTime)? dateSelected;

  const OCalendar({super.key, this.dateSelected});


  @override
  State<OCalendar> createState() => _OCalendarState();
}

class _OCalendarState extends State<OCalendar> {
  DateTime _focusedMonth = DateTime.now();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    }


   List<DateTime> _generateDaysForMonth(DateTime month) {
    final firstDay = DateTime(month.year, month.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);
    final startWeekday = firstDay.weekday; 

    final prevMonth = DateTime(month.year, month.month - 1);
    final prevMonthDays = DateUtils.getDaysInMonth(prevMonth.year, prevMonth.month);
    final leadingDays = List.generate(
      startWeekday - 1,
      (i) => DateTime(prevMonth.year, prevMonth.month, prevMonthDays - startWeekday + i + 2),
    );

    final currentDays = List.generate(
      daysInMonth,
      (i) => DateTime(month.year, month.month, i + 1),
    );

    final totalCells = 42; 
    final remaining = totalCells - (leadingDays.length + currentDays.length);
    final nextMonth = DateTime(month.year, month.month + 1);
    final trailingDays = List.generate(
      remaining,
      (i) => DateTime(nextMonth.year, nextMonth.month, i + 1),
    );

    return [...leadingDays, ...currentDays, ...trailingDays];
  }

@override
Widget build(BuildContext context) {
  final days = _generateDaysForMonth(_focusedMonth);

  return Container(
    padding: const EdgeInsets.all(OSpacing.m),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              onPressed: () {
                setState(() {
                  _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
                });
              },
            ),
            Text(
              DateFormat('MMMM yyyy').format(_focusedMonth),
              style: OTextStyle.labelMedium.copyWith(color: OColor.gray800),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right),
              onPressed: () {
                setState(() {
                  _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
                });
              },
            ),
          ],
        ),
        SizedBox(height: OSpacing.xs),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]
              .map((d) => Expanded(
                    child: Center(
                      child: Text(d, style: OTextStyle.headingXSmall.copyWith(color: OColor.gray800)),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: OSpacing.xs),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            mainAxisSpacing: OSpacing.xxs,
            crossAxisSpacing: OSpacing.xxs,
          ),
          itemCount: days.length,
          itemBuilder: (context, index) {
            final day = days[index];
            final isCurrentMonth = day.month == _focusedMonth.month;
            final isSelected = DateUtils.isSameDay(day, _selectedDate);

            return GestureDetector(
              onTap: isCurrentMonth
                  ? () {
                      setState(() {
                        _selectedDate = day;
                        widget.dateSelected?.call(day);
                      });
                    }
                  : null,
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? OColor.green600 : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "${day.day}",
                  style: OTextStyle.headingXSmall.copyWith(
                    color: isCurrentMonth
                        ? (isSelected ? OColor.white : OColor.gray800)
                        : OColor.gray600,
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: OSpacing.xs),

      ]));
}
}


class MonthYearPicker extends StatefulWidget {
  const MonthYearPicker({super.key});

  @override
  State<MonthYearPicker> createState() => _MonthYearPickerState();
}

class _MonthYearPickerState extends State<MonthYearPicker> {
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;
  String selectedMonth = '';
int selectedYear = DateTime.now().year;

  final List<String> months = const [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

 @override
void initState() {
  super.initState();
  selectedMonth = months[currentMonth - 1];
  selectedYear = currentYear;
}

void _updateSelected() {
  selectedMonth = months[currentMonth - 1];
  selectedYear = currentYear;
}

void _increaseMonth() {
  setState(() {
    currentMonth++;
    if (currentMonth > 12) {
      currentMonth = 1;
      _increaseYear();
    }
    _updateSelected();
  });
}

void _decreaseMonth() {
  setState(() {
    currentMonth--;
    if (currentMonth < 1) {
      currentMonth = 12;
      _decreaseYear();
    }
    _updateSelected();
  });
}

void _increaseYear() {
  if (currentYear < 2025) {
    setState(() {
      currentYear++;
      _updateSelected();
    });
  }
}

void _decreaseYear() {
  setState(() {
    currentYear--;
    _updateSelected();
  });
}

  @override
  Widget build(BuildContext context) {

    final mainStyle = OTextStyle.headingLarge.copyWith(color: OColor.gray800);
    final fadedStyle = OTextStyle.labelMedium.copyWith(color:  OColor.gray400);

    const monthWidth = 150.0;
    const yearWidth = 80.0;

    String prevMonth = months[(currentMonth - 2 + 12) % 12];
    String nextMonth = months[currentMonth % 12];
    String prevYear = (currentYear - 1).toString();
    String nextYear = currentYear < 2025 ? (currentYear + 1).toString() : '';

    return Container(
      padding: const EdgeInsets.all(OSpacing.m),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: OColor.gray600,),
                  onPressed: _increaseMonth,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              SizedBox(width: OSpacing.m),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: OColor.gray600),
                  onPressed: _decreaseYear,
                  padding: EdgeInsets.zero,
                 visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),

         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: Text(prevMonth, style: fadedStyle, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: OSpacing.m),
              SizedBox(
                width: yearWidth,
                child: Text(nextYear, style: fadedStyle, textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: OSpacing.xxs),

         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: Text(selectedMonth, style: mainStyle, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: OSpacing.m),
              SizedBox(
                width: yearWidth,
                child: Text(selectedYear.toString(), style: mainStyle, textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: OSpacing.xxs),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: Text(nextMonth, style: fadedStyle, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: OSpacing.m),
              SizedBox(
                width: yearWidth,
                child: Text(prevYear, style: fadedStyle, textAlign: TextAlign.center),
              ),
            ],
          ),

         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: OColor.gray600,),
                  onPressed: _decreaseMonth,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              SizedBox(width: OSpacing.m),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: OColor.gray600,),
                  onPressed: _increaseYear,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class DateMonthYearPicker extends StatefulWidget {
  const DateMonthYearPicker({super.key});

  @override
  State<DateMonthYearPicker> createState() => _DateMonthYearPickerState();
}

class _DateMonthYearPickerState extends State<DateMonthYearPicker> {
  int currentDay = DateTime.now().day;
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;
  late int selectedDay;
late String selectedMonth;
late int selectedYear;



  final List<String> months = const [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"
  ];



  @override
void initState() {
  super.initState();
  selectedDay = currentDay;
  selectedMonth = months[currentMonth - 1];
  selectedYear = currentYear;
}

void _updateSelected() {
  selectedDay = currentDay;
  selectedMonth = months[currentMonth - 1];
  selectedYear = currentYear;
}

  void _increaseDay() {
    int daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;
    setState(() {
      currentDay++;
      if (currentDay > daysInMonth) {
        currentDay = 1;
        _increaseMonth();
      }
       _updateSelected();
    });
  }

  void _decreaseDay() {
  
    setState(() {
      currentDay--;
      if (currentDay < 1) {
        _decreaseMonth();
        currentDay = DateTime(currentYear, currentMonth + 1, 0).day;
      }
       _updateSelected();
    });
  }


  void _increaseMonth() {
    setState(() {
      currentMonth++;
      if (currentMonth > 12) {
        currentMonth = 1;
        _increaseYear();
      }
       _updateSelected();
    });
  }

  void _decreaseMonth() {
    setState(() {
      currentMonth--;
      if (currentMonth < 1) {
        currentMonth = 12;
        _decreaseYear();
      }
       _updateSelected();
    });
  }

  void _increaseYear() {
  if (currentYear < 2025) {
    setState(() {
      currentYear++;
      _updateSelected();
    });
  }
}

void _decreaseYear() {
  setState(() {
    currentYear--;
    _updateSelected();
  });
}


  @override
  Widget build(BuildContext context) {
    final mainColor = OTextStyle.headingLarge.copyWith(color: OColor.gray800);
    final fadedColor =  OTextStyle.labelMedium.copyWith(color: OColor.gray400);

    const dayWidth = 50.0;
    const monthWidth = 60.0;
    const yearWidth = 70.0;

    int prevDay = currentDay - 1 < 1 ? DateTime(currentYear, currentMonth, 0).day : currentDay - 1;
    int nextDay = (currentDay % DateTime(currentYear, currentMonth + 1, 0).day) + 1;

    String prevMonth = months[(currentMonth - 2 + 12) % 12];
    String nextMonth = months[currentMonth % 12];

    String prevYear = (currentYear - 1).toString();
    String nextYear = currentYear < 2025 ? (currentYear + 1).toString() : '';

    return Container(
      padding: const EdgeInsets.all(OSpacing.m),
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: OColor.gray600),
                  onPressed: _increaseDay,
                  padding: EdgeInsets.zero,
                 visualDensity: VisualDensity.compact,
                ),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: OColor.gray600),
                  onPressed: _increaseMonth,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_up, color: OColor.gray600),
                  onPressed: _decreaseYear,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),

         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: Text(prevDay.toString(), style: fadedColor, textAlign: TextAlign.center),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: monthWidth,
                child: Text(prevMonth, style: fadedColor, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: yearWidth,
                child: Text(nextYear, style:fadedColor,  textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: OSpacing.xxs),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: Text(selectedDay.toString(), style:  mainColor, textAlign: TextAlign.center),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: monthWidth,
                child: Text(selectedMonth, style:  mainColor, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: yearWidth,
                child: Text(selectedYear.toString(), style:mainColor, textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: OSpacing.xxs),

          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: Text(nextDay.toString(), style: fadedColor, textAlign: TextAlign.center),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: monthWidth,
                child: Text(nextMonth, style: fadedColor, textAlign: TextAlign.center, softWrap: false),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: yearWidth,
                child: Text(prevYear, style: fadedColor,  textAlign: TextAlign.center),
              ),
            ],
          ),
          SizedBox(height: OSpacing.xxs),

        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: dayWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: OColor.gray600),
                  onPressed: _decreaseDay,
                  padding: EdgeInsets.zero,
                 visualDensity: VisualDensity.compact,
                ),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: monthWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: OColor.gray600),
                  onPressed: _decreaseMonth,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ),
              SizedBox(width: OSpacing.xs),
              SizedBox(
                width: yearWidth,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_down, color: OColor.gray600),
                  onPressed: _increaseYear,
                  padding: EdgeInsets.zero,
                 visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

