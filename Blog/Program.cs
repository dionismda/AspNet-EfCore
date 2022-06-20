using Blog.Data;

namespace Blog
{
    class Program
    {
        static void Main(string[] args)
        {
            using (var context = new BlogDataContext())
            {
                // var tag = new Tag { Name = ".NET", Slug = "dotnet" };
                // context.Tags.Add(tag);
                // context.SaveChanges();

                // var tag2 = new Tag { Name = "ASP.NET", Slug = "aspnet" };
                // context.Tags.Add(tag2);
                // context.SaveChanges();

                // var tag = context.Tags.FirstOrDefault(x => x.Id == 2);
                // tag.Name = ".NET";
                // tag.Slug = "dotnet";

                // context.Update(tag);
                // context.SaveChanges();

                // var tag = context.Tags.FirstOrDefault(x => x.Id == 2);

                // context.Remove(tag);
                // context.SaveChanges();

                // var tags = context
                //     .Tags
                //     .AsNoTracking()
                //     .ToList();

                // foreach (var tag in tags)
                // {
                //     Console.WriteLine(tag.Name);
                // }

                // var tag = context
                //     .Tags
                //     .AsNoTracking()
                //     .FirstOrDefault(x => x.Id == 3);

                // Console.WriteLine(tag?.Name);



                // var user = new User
                // {
                //     Name = "TesteTesteTeste",
                //     Slug = "teste",
                //     Email = "teste@teste.com.br",
                //     Bio = "teste",
                //     Image = "https://teste.jpg",
                //     PasswordHash = "123098457"
                // };
                //
                // var category = new Category {Name = "Backend", Slug = "backend"};
                //
                // var post = new Post
                // {
                //     Author = user,
                //     Category = category,
                //     Body = "Teste Body",
                //     Slug = "Teste Slug",
                //     Summary = "Teste Summary",
                //     Title = "Teste Title",
                //     CreateDate = DateTime.Now,
                //     LastUpdateDate = DateTime.Now,
                // };
                //
                // context.Posts.Add(post);
                // context.SaveChanges();

                // var posts = context
                //     .Posts
                //     .AsNoTracking()
                //     .Include(x => x.Author)
                //     .Include(x => x.Category)
                //     .OrderBy(x => x.LastUpdateDate)
                //     .ToList();
                //
                // foreach (var post in posts) 
                //     Console.WriteLine($"{post.Title} por {post.Author?.Name} em {post.Category?.Name}");

                // var post = context
                //     .Posts
                //     .Include(x => x.Author)
                //     .Include(x => x.Category)
                //     .OrderBy(x => x.LastUpdateDate)
                //     .FirstOrDefault();
                //
                // post.Author.Name = "Teste2";
                //
                // context.Posts.Update(post);
                // context.SaveChanges();
            }
        }
    }
}