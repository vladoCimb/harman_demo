import 'dart:async';
import 'package:feed_repository/models/feed_model.dart';

class FeedRepository {
  Future<List<FeedModel>> getFeedData() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final feedEntities = [
      const FeedModel(
        title: 'Amazing Nature Documentary',
        description:
            'Embark on an extraordinary journey through the world\'s most pristine wilderness areas in this breathtaking documentary. From the towering peaks of the Himalayas to the crystal-clear waters of the Great Barrier Reef, witness the incredible diversity of life that calls these untouched landscapes home. Follow expert wildlife photographers as they capture intimate moments with endangered species, revealing the delicate balance of ecosystems and the urgent need for conservation efforts.',
        videoUrl: 'https://example.com/video1.mp4',
        likedByUser: false,
      ),
      const FeedModel(
        title: 'Cooking Masterclass',
        description:
            'Join an exclusive culinary journey with Michelin-starred chefs as they share their most coveted techniques and secret recipes. From mastering the perfect knife skills and understanding flavor profiles to creating restaurant-quality dishes in your own kitchen, this comprehensive masterclass covers everything from basic fundamentals to advanced plating techniques. Discover the art of molecular gastronomy, learn about sustainable cooking practices, and explore cuisines from around the world while developing your palate and culinary creativity.',
        videoUrl: 'https://example.com/video2.mp4',
        likedByUser: true,
      ),
      const FeedModel(
        title: 'Tech Innovation 2024',
        description:
            'Dive deep into the revolutionary technologies that are transforming industries and reshaping our world in 2024. From artificial intelligence and machine learning breakthroughs to quantum computing advances and sustainable energy solutions, this comprehensive exploration showcases how cutting-edge innovations are solving global challenges. Meet the visionary entrepreneurs and researchers behind groundbreaking startups, understand the implications of emerging technologies on society, and get an exclusive look at prototypes and concepts that will define the next decade of human progress.',
        videoUrl: 'https://example.com/video3.mp4',
        likedByUser: false,
      ),
      const FeedModel(
        title: 'Space Exploration Wonders',
        description:
            'Journey beyond Earth\'s atmosphere and explore the mysteries of our universe in this captivating space documentary. From the International Space Station to distant exoplanets, witness the incredible achievements of human space exploration. Discover how astronauts live and work in zero gravity, learn about the latest Mars rover missions, and get an inside look at the James Webb Space Telescope\'s groundbreaking discoveries. This immersive experience showcases humanity\'s quest to understand our place in the cosmos.',
        videoUrl: 'https://example.com/video4.mp4',
        likedByUser: true,
      ),
      const FeedModel(
        title: 'Urban Gardening Revolution',
        description:
            'Transform your living space into a thriving green oasis with innovative urban gardening techniques. Learn how to grow fresh herbs, vegetables, and flowers in small apartments, balconies, and even windowsills. Discover vertical gardening systems, hydroponic setups, and sustainable growing methods that maximize limited space. From seed selection to harvest, this comprehensive guide covers everything you need to start your own urban garden and enjoy the benefits of homegrown produce.',
        videoUrl: 'https://example.com/video5.mp4',
        likedByUser: false,
      ),
      const FeedModel(
        title: 'Mindfulness & Meditation',
        description:
            'Discover the transformative power of mindfulness and meditation in this comprehensive wellness guide. Learn ancient techniques adapted for modern life, from breathwork and body scanning to walking meditation and loving-kindness practices. Explore the science behind meditation\'s benefits for mental health, stress reduction, and emotional well-being. Whether you\'re a beginner or looking to deepen your practice, this program offers practical tools to cultivate inner peace and resilience in today\'s fast-paced world.',
        videoUrl: 'https://example.com/video6.mp4',
        likedByUser: true,
      ),
      const FeedModel(
        title: 'Street Art & Graffiti Culture',
        description:
            'Immerse yourself in the vibrant world of street art and graffiti culture, where urban landscapes become canvases for creative expression. Meet talented artists who transform city walls into stunning murals, learn about the history and evolution of graffiti art, and discover the social and political messages behind these powerful visual statements. From underground train tunnels to legal street art festivals, explore how this dynamic art form continues to shape urban environments and challenge conventional notions of art.',
        videoUrl: 'https://example.com/video7.mp4',
        likedByUser: false,
      ),
      const FeedModel(
        title: 'Sustainable Fashion Revolution',
        description:
            'Explore the growing movement toward sustainable and ethical fashion that\'s reshaping the clothing industry. Learn about eco-friendly materials, fair trade practices, and innovative recycling techniques that are reducing fashion\'s environmental impact. Meet designers who are creating beautiful, sustainable clothing lines and discover how consumers can make more conscious fashion choices. From upcycling vintage pieces to supporting ethical brands, this guide shows how style and sustainability can go hand in hand.',
        videoUrl: 'https://example.com/video8.mp4',
        likedByUser: true,
      ),
      const FeedModel(
        title: 'Music Production Mastery',
        description:
            'Unlock the secrets of professional music production in this comprehensive course designed for aspiring producers and musicians. Learn essential techniques for recording, mixing, and mastering tracks across various genres. Explore digital audio workstations, virtual instruments, and advanced sound design methods. From bedroom producers to studio professionals, discover how to create polished, radio-ready music using both traditional and cutting-edge production techniques.',
        videoUrl: 'https://example.com/video9.mp4',
        likedByUser: false,
      ),
      const FeedModel(
        title: 'Adventure Travel Destinations',
        description:
            'Pack your bags and embark on thrilling adventures to some of the world\'s most spectacular destinations. From trekking through Patagonia\'s rugged landscapes to diving in the Maldives\' crystal-clear waters, discover bucket-list experiences that will create lasting memories. Learn essential travel tips, safety guidelines, and cultural etiquette for each destination. Whether you\'re seeking adrenaline-pumping activities or peaceful nature retreats, this guide will inspire your next great adventure.',
        videoUrl: 'https://example.com/video10.mp4',
        likedByUser: true,
      ),
      const FeedModel(
        title: 'Digital Photography Techniques',
        description:
            'Master the art of digital photography with professional techniques that will elevate your images from good to extraordinary. Learn about composition, lighting, exposure, and post-processing methods used by professional photographers. Explore different photography genres including portrait, landscape, street, and macro photography. From camera settings to editing software, this comprehensive course covers everything you need to capture stunning photographs and develop your unique artistic vision.',
        videoUrl: 'https://example.com/video11.mp4',
        likedByUser: false,
      ),
      const FeedModel(
        title: 'Home Workout Revolution',
        description:
            'Transform your living space into a personal fitness studio with effective home workout routines that require minimal equipment. Discover bodyweight exercises, resistance training, and cardio workouts that can be done anywhere. Learn proper form and technique to maximize results while preventing injury. From beginner-friendly routines to advanced challenges, this program offers workouts for all fitness levels. Achieve your health and fitness goals without ever leaving home.',
        videoUrl: 'https://example.com/video12.mp4',
        likedByUser: true,
      ),
    ];

    return feedEntities;
  }
}
