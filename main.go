package main

import (
	"context"
	"log"

	pb "github.com/erikperttu/shippy-user-service/proto/auth"
	micro "github.com/micro/go-micro"
)

const topic = "user.created"

// Subscriber empty struct
type Subscriber struct{}

// Process currently just logs what happend
func (sub *Subscriber) Process(ctx context.Context, user *pb.User) error {
	log.Println("Picked up a new message")
	log.Println("Sending email to: ", user.Name)
	return nil
}

func main() {
	srv := micro.NewService(
		micro.Name("shippy.email"),
		micro.Version("latest"),
	)

	// Init will parse the cmd line flags
	srv.Init()

	micro.RegisterSubscriber(topic, srv.Server(), new(Subscriber))

	if err := srv.Run(); err != nil {
		log.Println(err)
	}
}
