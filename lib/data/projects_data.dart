class WorkItem {
  final String title;
  final String desc;
  final String image;
  final bool isWebUrl;
  final List<String> tags;

  WorkItem({
    required this.title,
    required this.desc,
    required this.image,
    required this.isWebUrl,
    required this.tags,
  });
}

final List<WorkItem> works = [
  WorkItem(
    title: 'OneDay Worker',
    desc:
    'A mobile app to find and book trusted workers for one or multiple days. Users can browse verified professionals, select services, compare profiles, and book instantly with confidence.',
    isWebUrl: false,
    image: 'assets/OneDayWorkerBig.png',
    tags: ['Flutter', 'SpringBoot', 'Live-Data', 'PostgreSQL'],
  ),
  WorkItem(
    title: 'Java Learning',
    desc:
    'A beginner-friendly Java learning platform covering basics to advanced concepts. It offers structured topics, real code examples, interview questions, and interactive lessons.',
    isWebUrl: false,
    image: 'assets/SaanDevBig.png',
    tags: ['Angular', 'SpringBoot', 'MySQL'],
  ),
  WorkItem(
    title: 'Healthcare Dashboard',
    desc:
    'A data-driven admin dashboard for hospitals and clinics that provides real-time insights, analytics, and monitoring tools to improve operational efficiency and decision-making.',
    isWebUrl: true,
    image:
    'https://s3-alpha.figma.com/hub/file/5382060381/182556ae-d6dd-4f11-9bbd-fb6236d8de91-cover.png',
    tags: ['React', '.Net', 'PostgreSQL'],
  ),
  WorkItem(
    title: 'Ecommerce',
    desc:
    'A modern e-commerce app delivering a realistic online shopping experience. Users can browse products, view details, and shop seamlessly with a clean UI and intuitive navigation.',
    isWebUrl: false,
    image: 'assets/Ecommerce.png',
    tags: ['Kotlin', 'Angular', 'SpringBoot', 'MySQL'],
  ),
  WorkItem(
    title: 'Employee Management',
    desc:
    'A centralized employee management portal to manage staff, track attendance, assign tasks, and monitor performance. Built for productivity, transparency, and smooth team coordination.',
    isWebUrl: false,
    image: 'assets/EmpManegement.png',
    tags: ['React', '.Net', 'PostgreSQL'],
  ),
];
